import React, { useEffect, useState } from "react";
import {Link} from 'react-router-dom'
import * as API from '../../servicios/servicios'


export function ListaHuertas(){
    const [huertas,setHuertas]=useState([]);
    const [mensajeError, setmensajeError] = useState('')
    const [mensajeSuccess, setmensajeSuccess] = useState('')


    useEffect(()=>{
        API.getHuertas().then(setHuertas)
    },[])

    const bajaHuerta  = async(id_huerta)=>{
        const huerta = await API.BajaHuerta(id_huerta)
        if(huerta.status){
            
            setmensajeError(huerta.mensaje)
            setTimeout(()=>{
                setmensajeError('')
                window.location.reload(true)
 
            }, 3000)
        }else{
            setmensajeError(huerta.mensaje)
            setTimeout(()=>{
                setmensajeError('')
            }, 4000)
        }
    }
    const altaHuerta  = async(id_huerta)=>{
        const huerta = await API.AltaHuerta(id_huerta)
        if(huerta.status){
            
            setmensajeSuccess(huerta.mensaje)
            setTimeout(()=>{
                setmensajeSuccess('')
                window.location.reload(true)
 
            }, 3000)
        }else{
            setmensajeError(huerta.mensaje)
            setTimeout(()=>{
                setmensajeError('')
            }, 4000)
        }
    }



    return(
        <div className="card">
            <div className="card-header">
                Listado de Huertas
            </div>
            {
                    mensajeError?
                    <div className="alert alert-warning" role="alert">
                     {mensajeError}
                    </div>:''
                }

                {
                    mensajeSuccess?
                    <div className="alert alert-success" role="alert">
                     {mensajeSuccess}
                    </div>:''
                }

            <div className="card-body">
                <Link name="" id="" className="btn btn-primary" to={'/crearHuerta'} role="button">Nueva Huerta</Link>
                <table className="table table-striped table-inverse table-responsive">
                <thead className="thead-inverse">
                     <tr></tr>
                         <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Localidad</th>
                             <th>Acciones</th>
            
                         </tr>
                    </thead>
                    <tbody>
                        {huertas.map((huerta)=>(
                            <tr key={huerta.id_huerta}>
                                <td scope="row">{huerta.id_huerta}</td>
                                <td scope="row">{huerta.nombre}</td>
                                <td scope="row">{huerta.localidad}</td>
                                <td>
                                <div className="btn-group" role="group" aria-label="">
                                { (huerta.estado=='A')?
                                    <>
                                        <button onClick={() =>bajaHuerta(huerta.id_huerta)} type="button" className="btn btn-danger"> Dar de Baja </button>
                                        <Link to={`/editar_huerta/${huerta.id_huerta}`}>
                                        <button  type="button" className="btn btn-warning"> Modificar </button>                       
                                        </Link>
                                    </>
                                    : 
                                    <>
                                        <button onClick={() =>altaHuerta(huerta.id_huerta)}  type="button" className="btn btn-success"> Dar de Alta </button>

                                    </>
                                }

                                </div>
                                </td>
                            </tr>
                        ))}
                    
                    </tbody>
                </table>
            </div>
            <div className="card-footer text-muted">
                Mi Huerta - Silicon Misiones
            </div>
        </div>
        
    )
}