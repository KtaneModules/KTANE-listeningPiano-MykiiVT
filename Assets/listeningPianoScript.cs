using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Linq;
using KModkit;
using System.Text.RegularExpressions;

public class listeningPianoScript : MonoBehaviour {

	public KMAudio Audio;
	public KMBombInfo Bomb;
	public KMBombModule Module;
	public KMSelectable[] PianoKeys;
	public KMSelectable PlayButton;
	public KMSelectable Switch;

	public Transform[] Spinners;

	public GameObject Labels;

	public SwitchMovement switchMovement;

	static int moduleIdCounter = 1;
	int moduleId;

	int[][] Songs;

	int SelectedSongIndex;
	int[] SelectedSong;
	WaitForSeconds delay;
	WaitForSeconds HalfDelay;
	WaitForSeconds PrePlayDelay = new WaitForSeconds(0.2f);
	WaitForSeconds KeepSpinnersGoingFor = new WaitForSeconds(0.5f);
	WaitForSeconds PostPlayDelay = new WaitForSeconds(2f);
	int PlayerTransposeUp;
	int PlayerToInputTranspose;
	int HighestNote;
	int LastNote;
	public String[] SongNames;
	String SelectedSongName;
	int Stage;
	int CorrectAnswer;

	private bool LockedToSubmit;
	public bool Playing = false;
	int SpinSpeed = 300;
	float RewindTime = 1.4f;
	private bool moduleSolved;

	private Coroutine playSongCoroutine;
	private Coroutine SpinCoroutine;
	bool TwitchPlaysActive;
	List<int> LogList = new List<int>();

	void Awake()
	{
		moduleId = moduleIdCounter++;

		Songs = new int[][]
		{
			//All songs are given here in the lowest possible key

			//The first index of each song is metadata indicating the BPM where each index is a beat

			//-1 denotes a rest

			//0. Frosty the Snowman
			new int[]{400,
			3,-1,-1,-1,
			0,-1,-1,
			1,
			3,-1,
			8,-1,-1,-1,
			7,
			8,
			10,-1,
			8,-1,
			7,-1,
			5,-1,
			3},

			//1. Tetris
			new int[]{300,
			7,-1,
			2,
			3,
			5,-1,
			3,
			2,
			0,-1,
			0,
			3,
			7},

			//2. Still Alive(Radio Mix)
			new int[]{480,
			10,
			9,-1,
			7,-1,-1,
			9,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			10,
			9,-1,
			7,-1,-1,
			9,-1,
			5,-1,
			7,
			0},

			//3. Can Can
			new int[]{300,
			0,-1,-1,-1,
			2,
			5,
			4,
			2,
			7,-1,
			7,-1,
			7,
			9,
			4,
			5,
			2,-1,
			2},

			//4. Wait(KTANE OST)
			new int[]{260,
			0,-1,
			7,
			0,
			0,
			3,
			4,
			5,-1,
			9,-1,
			3,
			5,
			3,
			5,
			3},

			//5. Fur Elise
			new int[]{240,
			7,6,7,6,7,2,5,3,0},

			//6. Spring(Vivaldi)
			new int[]{480,
			4, -1,
			4, -1,
			4, -1,
			2,
			0,
			7,-1,-1,-1,-1,-1,
			7,
			5,
			4, -1,
			4, -1,
			4, -1,
			2,
			0,
			7},

			//7. Never Gonna Give You Up
			new int[]{480,
            0,
			2,
			5,
			2,
			9,-1,-1,
			9,-1,-1,
			7,-1,-1,-1,-1,-1,
			0,
			2,
			4,
			0,
			7,-1,-1,
			7,-1,-1,
			5},

			//8. A Cruel Angel's Thesis(Evangelion)
			new int[]{520,
            0,-1,-1,-1,
			3,-1,-1,-1,
			5,-1,-1,
			3,-1,-1,
			5,-1,
			5,-1,
			5,-1,
			10,-1,
			8,-1,
			7,
			5,-1,
			7},

			//9. It's Been So Long(The Living Tombstone)
			new int[]{510,
			2,-1,
			5,
			9,-1,
			2,
			5,-1,
			9,
			2,-1,
			1,
			0,-1,
			4,
			10,-1,
			0,
			4,-1,
			10,
			7,-1,
			4},

			//10. Happy Birthday
			new int[]{390,
			0,-1,
			0,
			2,-1,-1,
			0,-1,-1,
			5,-1,-1,
			4,-1,-1,-1,-1,-1,
			0,-1,
			0,
			2,-1,-1,
			0,-1,-1,
			7,-1,-1,
			5},

			//11. Billie Jean
			new int[]{240,
			7,2,5,7,5,2,0,2,7,2,5,7,5,2,0,2},

			//12. Despacito
			new int[]{1080,
			5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			0,-1,-1,
			5,-1,-1,
			7,-1,-1,
			8,-1,-1,-1,
			10,-1,-1,-1,
			8,-1,-1,-1,
			7,-1,-1,-1,
			5,-1,-1,-1,
			3,-1,-1,-1,
			1,-1,-1,-1,-1,-1,-1,-1,-1,
			8,-1,-1,-1,-1,-1,-1,-1,-1,
			8},

			//13. Blue(Da Ba Dee)
			new int[]{240,
			4,-1,
			5,-1,
			2,
			5,
			7,
			0,
			4,
			5,-1,
			2,
			5,
			9,
			10,-1,
			9,
			7,
			5},

			//14. Among Us(Trap Remix)
			new int[]{360,
			2,-1,-1,-1,
			2,-1,
			5,-1,
			7,-1,
			8,-1,
			7,-1,
			5,-1,
			2,-1,-1,-1,-1,-1,
			0,
			4,
			2},

			//15. Hello(OMFG)
			new int[]{600,
			0,-1,-1,-1,-1,-1,
			0,-1,
			2,
			3,-1,
			7,
			8,-1,-1,
			8,-1,-1,
			8,-1,
			7,
			5,-1,
			7,
			3},

			//16. Axel F
			new int[]{440,
			2,-1,-1,-1,
			5,-1,-1,
			2,-1,
			2,
			7,-1,
			2,-1,
			0,-1,
			2,-1,-1,-1,
			9,-1,-1,
			2,-1,
			2,
			10,-1,
			9,-1,
			5},

			//17. Unity(TheFatRat)
			//How serendipitous
			new int[]{540,
			9,
			7,-1,
			5,
			2,-1,
			0,
			2,-1,-1,-1,-1,
			9,
			7,-1,
			5,
			2,-1,
			0,
			2,-1,-1,-1,-1,
			9,
			7,-1,
			5,
			2,-1,
			0,
			2,-1,-1,
			5,-1,-1,
			7,-1,-1,
			9,-1,-1,
			7},

			//18. In the Hall of the Mountain King
			new int[]{240,
			0,
			2,
			3,
			5,
			7,
			3,
			7,-1,
			6,
			2,
			6,-1,
			5,
			1,
			5},

			//19. Buddy Holly
			new int[]{240,
			5,1,5,7,9,7,5,1,0},

			//20. Ode to Joy
			new int[]{280,
			4, -1,
			4, -1,
			5, -1,
			7, -1,
			7, -1,
			5, -1,
			4, -1,
			2, -1,
			0, -1,
			0, -1,
			2, -1,
			4, -1,
			4, -1, -1,
			2,
			2},

			//21. Victory Jingle(KTANE)
			new int[]{460,
			2,
			0,
			2,
			5, -1, -1,
			7,
			5,
			7,
			9, -1, -1,
			0, -1,
			1, -1,
			2}
		};

		//Tell each key to go down and come up when appropriate
		foreach(KMSelectable key in PianoKeys)
        {
			key.OnInteract += delegate () { Keypress(key); return false; };
			key.OnInteractEnded += delegate () { Lift(key);};
		}
		PlayButton.OnInteract += delegate () { ButtonPress(); return false; };
		PlayButton.OnInteractEnded += delegate () { LiftButton(); };
		Switch.OnInteract += delegate () { FlipSwitch(); return false; };
		Module.OnActivate += delegate () {
			if(TwitchPlaysActive)
			{
				Labels.SetActive(true);
			}
		};
	}

	// Use this for initialization
	void Start()
	{
		Stage = 1;

		//Choose a random song
		SelectedSongIndex = UnityEngine.Random.Range(0, Songs.Length);

		//DEBUGGING: Choose a predetermined song here
		//SelectedSongIndex = 10;

		SelectedSong = Songs[SelectedSongIndex].ToArray();

		SelectedSongName = SongNames[SelectedSongIndex];

        delay = new WaitForSeconds(60f / SelectedSong[0]);
		HalfDelay = new WaitForSeconds(60f / (2 * SelectedSong[0]));

		HighestNote = 0;

		int index = 0;
		foreach(int note in SelectedSong)
        {
			if(index != 0 && note > HighestNote)
            {
				HighestNote = note;
            }
			index++;
        }
		

		//Choose how many semitones to transpose the player up. Add 1 to the bound because the upper bound is exclusive.
		PlayerTransposeUp = UnityEngine.Random.Range(0, 12 - HighestNote);


		//Debug.Log($"The highest note is {HighestNote}. Chose to transpose up {PlayerTransposeUp} semitones out of {11 - HighestNote}.");

		//Repeat this the same number of times as the length of SelectedSong - 1, incrementing i each time starting at 0
		for (int i = 0; i < SelectedSong.Length; i++)
        {
			//Only transpose the note up if it is not the first element or a rest
			if(i != 0 && SelectedSong[i] != -1)
            {
				SelectedSong[i] += PlayerTransposeUp;
            }
        }
		Debug.Log($"[Listening Piano Keys #{moduleId}] The song is {SelectedSongName}. \nAcceptable starting notes(inclusive): {SelectedSong[1] - PlayerTransposeUp} - {SelectedSong[1] - PlayerTransposeUp + 11 - HighestNote}");
	}

	void Keypress(KMSelectable key)
    {
		//Debug.Log($"You pressed {key.name}.");

		Audio.PlaySoundAtTransform(key.name.ToString(), transform);
		Vector3 currentRotation = key.transform.localEulerAngles;
		currentRotation.x = 7f;
		key.transform.localRotation = Quaternion.Euler(currentRotation);

		//If Submit mode is on and the module is not yet solved
		if(switchMovement.SwitchState & moduleSolved == false)
        {
			//If the stage is 1 and the pressed note is one that puts the rest of the song within range
			if (Stage == 1 &&
			int.Parse(key.name) >= SelectedSong[1] - PlayerTransposeUp &&
			int.Parse(key.name) <= SelectedSong[1] - PlayerTransposeUp + 11 - HighestNote)
			{
				LockedToSubmit = true;
				LogList.Add(int.Parse(key.name));

				//Calculate the number of semitones to transpose each note up for the correct answer(may be negative)
				PlayerToInputTranspose = int.Parse(key.name) - SelectedSong[1];
				Stage++;
				LastNote = SelectedSong[1];
				//Skip any rests or repeated notes
				while (SelectedSong[Stage] == -1 || SelectedSong[Stage] == LastNote)
				{
					Stage++;
				}
			}
			//If the first note pressed doesn't put the rest of the song within range
			else if (Stage == 1)
			{
				LogList.Clear();
				//Strike
				switchMovement.SwitchState = false;

				//For TP
				playinginput = false;
				foreach (KMSelectable pianokey in PianoKeys)
				{
					Lift(pianokey);
				}
				//PUT NUMBER OF THE PLAYED NOTE HERE FOR THE TABLE
				if(int.Parse(key.name) < SelectedSong[1] - PlayerTransposeUp)
				{
					Debug.Log($"[Listening Piano Keys #{moduleId}] The lowest note of the song is {SelectedSong[1] - PlayerTransposeUp} notes below the starting note. The played starting note puts this note out of range. Striking and reselecting song.\nKey played:{key.name}");
				}
				else
				{
					Debug.Log($"[Listening Piano Keys #{moduleId}] The highest note of the song is {HighestNote + PlayerTransposeUp - SelectedSong[1]} notes above the starting note. The played starting note puts this note out of range. Striking and reselecting song.\nKey played:{key.name}");
				}
				//Debug.Log($"[Listening Piano Keys #{moduleId}] Began on a note that puts some of the song out of range. Striking and reselecting song.");
				GetComponent<KMBombModule>().HandleStrike();
				Start();
			}
			else
            {
				//If not all the notes have been played
				if(Stage < SelectedSong.Length)
				{
					CorrectAnswer = SelectedSong[Stage] + PlayerToInputTranspose;

					//If the next different note is correctly played
					if (int.Parse(key.name) == CorrectAnswer)
					{
						LogList.Add(int.Parse(key.name));
						LastNote = SelectedSong[Stage];
						Stage++;
						//Skip any rests or repeated notes
						while (Stage < SelectedSong.Length && (SelectedSong[Stage] == -1 || SelectedSong[Stage] == LastNote))
						{
							Stage++;
						}
					}
					//If the last note played was played again
					else if(int.Parse(key.name) == LastNote + PlayerToInputTranspose)
					{
						//ignore it so that the player is allowed to safely misinterpret the number of times a note is immediately repeated
					}
					//If the incorrect note is played
					else
					{
						//Strike
						switchMovement.SwitchState = false;
						LockedToSubmit = false;

						//For TP
						playinginput = false;
						//TransposeSet = false;
						foreach(KMSelectable pianokey in PianoKeys)
						{
							Lift(pianokey);
						}
						LogList.Add(int.Parse(key.name));
						Debug.Log($"[Listening Piano Keys #{moduleId}] Played an incorrect note. Striking and reselecting song.\nPlayed notes(incorrect): {String.Join(", ", (LogList.Select(x => x.ToString())).ToArray())}");
						LogList.Clear();
						GetComponent<KMBombModule>().HandleStrike();
						Start();
					}
					//If all notes have now correctly been played
					if(Stage >= SelectedSong.Length)
					{
						//Solve!
						Debug.Log($"[Listening Piano Keys #{moduleId}] Played {SelectedSongName} correctly. Solved.\nPlayed notes(correct): {String.Join(", ", (LogList.Select(x => x.ToString())).ToArray())}");
						moduleSolved = true;
						LockedToSubmit = false;
						switchMovement.SwitchState = false;
						foreach(KMSelectable note in PianoKeys)
						{
							Lift(note);
						}
						GetComponent<KMBombModule>().HandlePass();
					}
				}
			}
		}
    }

	void Lift(KMSelectable key)
    {
		Vector3 currentRotation = key.transform.localEulerAngles;
		currentRotation.x = 0f;
		key.transform.localRotation = Quaternion.Euler(currentRotation);
	}

	void LiftButton()
    {
		Vector3 currentPosition = PlayButton.transform.localPosition;
		currentPosition.y = 0.0175f;
		PlayButton.transform.localPosition = (currentPosition);
    }

	void ButtonPress()
    {
		PlayButton.AddInteractionPunch();
		Vector3 currentPosition = PlayButton.transform.localPosition;
		currentPosition.y = 0.015f;
		PlayButton.transform.localPosition = (currentPosition);
		if(moduleSolved && playSongCoroutine == null)
		{
			//Choose a random song
			SelectedSongIndex = UnityEngine.Random.Range(0, Songs.Length);

			SelectedSong = Songs[SelectedSongIndex].ToArray();

			SelectedSongName = SongNames[SelectedSongIndex];

			delay = new WaitForSeconds(60f / SelectedSong[0]);
			HalfDelay = new WaitForSeconds(60f / (2 * SelectedSong[0]));

			HighestNote = 0;

			int index = 0;
			foreach(int note in SelectedSong)
			{
				if(index != 0 && note > HighestNote)
				{
					HighestNote = note;
				}
				index++;
			}
			

			//Choose how many semitones to transpose the player up. Add 1 to the bound because the upper bound is exclusive.
			PlayerTransposeUp = UnityEngine.Random.Range(0, 12 - HighestNote);

			//Repeat this the same number of times as the length of SelectedSong - 1, incrementing i each time starting at 0
			for (int i = 0; i < SelectedSong.Length; i++)
			{
				//Only transpose the note up if it is not the first element or a rest
				if(i != 0 && SelectedSong[i] != -1)
				{
					SelectedSong[i] += PlayerTransposeUp;
				}
			}
			playSongCoroutine = StartCoroutine(Play(SelectedSong));
		}
		else if(playSongCoroutine == null)
        {
			playSongCoroutine = StartCoroutine(Play(SelectedSong));
		}
		else
        {
			Audio.PlaySoundAtTransform("ListeningTapeAlreadyPlaying", transform);
		}
	}

	IEnumerator Play(int[] song)
    {
		Audio.PlaySoundAtTransform("ListeningTapePlay", transform);
		
		yield return PrePlayDelay;

		Playing = true;
		SpinCoroutine = StartCoroutine(SpinRoutine());
		int i = 0;
		foreach(int note in song)
        {
			if(i != 0)
            {
				if (note != -1)
                {
					Audio.PlaySoundAtTransform(note.ToString(), transform);
                }
				yield return delay;
            }
			i++;
        }
		yield return KeepSpinnersGoingFor;
		Playing = false;
		Audio.PlaySoundAtTransform("ListeningTapeStop", transform);
		yield return PostPlayDelay;
		playSongCoroutine = null;
    }

    IEnumerator SpinRoutine()
    {
        while (Playing)
        {
			foreach(Transform spinner in Spinners)
            {
				Vector3 currentRotation = spinner.localRotation.eulerAngles;
				currentRotation.z += Time.deltaTime * SpinSpeed;
				spinner.localRotation = Quaternion.Euler(currentRotation);
            }
			yield return null;
        }

		yield return PrePlayDelay;

		float time = 0f;

		while (time < RewindTime)
		{
			time += Time.deltaTime;
			foreach (Transform spinner in Spinners)
			{
				Vector3 currentRotation = spinner.localRotation.eulerAngles;
				currentRotation.z -= Time.deltaTime * 2 * SpinSpeed;
				spinner.localRotation = Quaternion.Euler(currentRotation);
			}
			yield return null;
		}
	}

    void FlipSwitch()
    {
		Switch.AddInteractionPunch();
		if (!(switchMovement.SwitchState && LockedToSubmit))
        {
			GetComponent<KMAudio>().PlayGameSoundAtTransform(KMSoundOverride.SoundEffect.ButtonPress,transform);
			switchMovement.SwitchState = !switchMovement.SwitchState;
			Stage = 1;
		}
		else
        {
			switchMovement.JiggleLock();
        }
	}

	List<int> TwitchPlaysInput = new List<int>();
	List<int> ListToPlay = new List<int>();
	//int TPTranspose;
	bool playinginput = false;
	//bool TransposeSet = false;

	//These variables are "cursors" that store the positions that the program is currently comparing
	int PlaceInSelected = 1;
	int PlaceInInput = 0;
	int SelectedHold;
	int InputHold;

	//The @ before the string turns off escape sequences such as \s, \d or \n
	private readonly String TwitchHelpMessage = @"Listening Piano Keys : !{0} play, !{0} p [Plays the tune] | !{0} toggle, !{0} t [Toggles the switch] | !{0} 1 2 3 4 5 6 7 8 9 10 11 12 [Plays all twelve keys in order from left to right]";

	IEnumerator ProcessTwitchCommand(string command)
    {
		//Debug.Log(playinginput);
        MatchCollection matches = Regex.Matches(command, @"\d+");
		
		TwitchPlaysInput.Clear();
		ListToPlay.Clear();
		PlaceInSelected = Stage;
		Debug.Log($"Stage is {Stage}.");
		PlaceInInput = 0;

        if (matches.Count > 0 && !playinginput)
		{
		    foreach (Match match in matches)
            {
				//Reject the command if it finds any numbers below 1 or above 12
                if (1 > int.Parse(match.Value) || int.Parse(match.Value) > 12)
                {
					//Debug.Log("Out of range MY OWN MESSAGE");
					yield break;
                }
				else
				{
					//Subtract 1 because the input range is 1-12 for intuitiveness, but the names of the keys go from 0-11
					TwitchPlaysInput.Add(int.Parse(match.Value) - 1);
				}
			}
			//TPTranspose is the number of semitones UP to transpose SelectedSong to get to the key that the TwitchPlaysInput is in
			// if(!TransposeSet && switchMovement.SwitchState)
			// {
			// 	TPTranspose = TwitchPlaysInput[0] - SelectedSong[1];
			// 	Debug.Log($"The TPTranspose is {TwitchPlaysInput[0]} - {SelectedSong[1]} = {TPTranspose}.");
			// 	TransposeSet = true;
			// }

			while (PlaceInInput < TwitchPlaysInput.Count && PlaceInSelected < SelectedSong.Length)
			{
				//Scan the input against the song to see if they all match
				//If the current note is correct
				// if(SelectedSong[PlaceInSelected] + TPTranspose == TwitchPlaysInput[PlaceInInput])
				// {
					//move each cursor to the next element that is not either the last note or a rest
					SelectedHold = SelectedSong[PlaceInSelected];
					InputHold = TwitchPlaysInput[PlaceInInput];

					while(SelectedSong[PlaceInSelected] == SelectedHold || SelectedSong[PlaceInSelected] == -1)
					{
						int ToAdd = (SelectedSong[PlaceInSelected] == -1) ? -1 : InputHold;
						ListToPlay.Add(ToAdd);
						PlaceInSelected++;
						if(PlaceInSelected >= SelectedSong.Length)
						{
							break;
						}
					}
					while(TwitchPlaysInput[PlaceInInput] == InputHold)
					{
						PlaceInInput++;
						if(PlaceInInput >= TwitchPlaysInput.Count)
						{
							break;
						}
					}
					//Debug.Log("Right");
				// }
				// //The current note is wrong
				// else
				// {
					// ListToPlay.Clear();
					// for (int i = Stage; i < PlaceInSelected; i++)
					// {
					// 	int ToAdd = (SelectedSong[i] == -1) ? -1 : SelectedSong[i] + TPTranspose;
					// 	ListToPlay.Add(ToAdd);
					// }
					// 	ListToPlay.Add(TwitchPlaysInput[PlaceInInput]);
					// 	Debug.Log("Wrong");
					// 	break;
				// }
			}
			Debug.Log("List to play: " + string.Join(", ", ListToPlay.Select(x => x.ToString()).ToArray()));

        //     //The place in SelectedSong, including rests
        //     int Place = 1;
		//		//Subtract 1 because the input range is 1-12 for intuitiveness, but the names of the keys go from 0-11
		// 		TwitchPlaysInput.Add(int.Parse(match.Value) - 1);
		//		 Place++;

        

		// 		//Copy the rests from the selected song to the TwitchPlaysInput list so that it plays the input to the rhythm
        //         while (Place < SelectedSong.Length && SelectedSong[Place] == -1)
        //         {
        //             TwitchPlaysInput.Add(-1);
        //             Place++;
        //         }
		// 	//Debug.Log("Calculated twitch input string to play.");

			playinginput = true;
			yield return null;
			for (int i = 0; i < ListToPlay.Count; i++)
            {
                int note = ListToPlay[i];
                if (note != -1)
                {
					yield return PianoKeys[note];
                    yield return HalfDelay;
                    yield return PianoKeys[note];
                }
                else
                {
                    yield return HalfDelay;
                }
				yield return HalfDelay;
			}
		// 	//Debug.Log("finished playing");
			foreach(KMSelectable key in PianoKeys)
            {
				Lift(key);
            }
			playinginput = false;
		// 	//Debug.Log(playinginput);
		}
        else if (command.IndexOf("p", StringComparison.OrdinalIgnoreCase) >= 0)
        {
            yield return null;
			yield return PlayButton;
			yield return PrePlayDelay;
			yield return PlayButton;
		}
        else if (command.IndexOf("t", StringComparison.OrdinalIgnoreCase) >= 0)
        {
            yield return null;
			yield return Switch;
			yield return Switch;
		}
        else
        {
			//Debug.Log("We got to here somehow");
			yield break;
        }
    }

	IEnumerator TwitchHandleForcedSolve()
	{
		yield return null;
		switchMovement.SwitchState = true;
		Stage = 1;
		playinginput = true;
		yield return null;
		for (int i = 1; i < SelectedSong.Length; i++)
		{
			int note = SelectedSong[i];
			if (note != -1)
			{
				PianoKeys[note].OnInteract();
				yield return HalfDelay;
				PianoKeys[note].OnInteractEnded();
			}
			else
			{
				yield return HalfDelay;
			}
			yield return HalfDelay;
		}
		foreach(KMSelectable key in PianoKeys)
		{
			Lift(key);
		}
		playinginput = false;
	}


	// Update is called once per frame
	void Update () {
		
	}
}
