using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cubeoid : MonoBehaviour {

    public Mesh mesh;
    public List<Vector3> newVertices;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
            MoveVertices();
    }

    void MoveVertices()
    {
        mesh.SetVertices(newVertices);
    }
}
