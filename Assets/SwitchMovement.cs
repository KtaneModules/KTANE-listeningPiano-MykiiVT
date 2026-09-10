using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Linq;
using KModkit;

public class SwitchMovement : MonoBehaviour {

	private bool _switchstate;

	private Vector3 PracticePos;
	private Vector3 SubmitPos;

	private Coroutine movementCoroutine;
	private Coroutine jiggleCoroutine;
	private float toggleDuration = 0.1f;
	private float jiggleDuration = 0.1f;

	void Awake()
    {
		PracticePos = transform.localPosition;
		SubmitPos = new Vector3(0.052f, PracticePos.y, PracticePos.z);
    }

	public bool SwitchState
    {
        get
        {
			return _switchstate;
        }
        set
        {
			//value is whatever SwitchState is set to elsewhere
			if(_switchstate != value)
            {
				_switchstate = value;
				StartSwitchAnimation();
            }
        }
    }

	void StartSwitchAnimation()
    {
		if(movementCoroutine != null)
        {
			StopCoroutine(movementCoroutine);
        }

		movementCoroutine = StartCoroutine(MoveSwitchRoutine());
    }

	public void JiggleLock()
    {
		if(jiggleCoroutine == null && movementCoroutine == null)
        {
			jiggleCoroutine = StartCoroutine(JiggleRoutine());
        }
    }

	IEnumerator JiggleRoutine()
    {
		Vector3 targetPos = PracticePos;
		Vector3 startPos = SubmitPos;

		float time = 0f;

		while(time < jiggleDuration)
        {
			time += Time.deltaTime;
			transform.localPosition = Vector3.Lerp(startPos, targetPos,(-1 * Mathf.Pow((time/jiggleDuration) - 0.5f,2)) + 0.25f);
			yield return null;
        }
		transform.localPosition = startPos;
		jiggleCoroutine = null;
    }

	IEnumerator MoveSwitchRoutine()
    {
		Vector3 startPos = transform.localPosition;
		Vector3 targetPos = _switchstate ? SubmitPos : PracticePos;

		float DistanceLeft = Mathf.Abs(startPos.x - targetPos.x);
		float adjustedDuration = toggleDuration * (DistanceLeft / 0.0195f);

		float time = 0f;

		while(time < adjustedDuration && adjustedDuration > 0f)
        {
			time += Time.deltaTime;
			transform.localPosition = Vector3.Lerp(startPos, targetPos, (-1 * Mathf.Pow((time / adjustedDuration) - 1,2)) + 1);
			yield return null;
        }
		transform.localPosition = targetPos;
		movementCoroutine = null;
    }

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
