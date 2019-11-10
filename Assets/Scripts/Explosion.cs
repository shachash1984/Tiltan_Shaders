using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Explosion : MonoBehaviour {

    public Material[] materials;

    private void Start()
    {
        GetComponent<Renderer>().material = materials[0];
    }

    void Update () {
		
        if(Input.GetKeyDown(KeyCode.Space))
            GetComponent<Renderer>().material = materials[1];
    }
}
