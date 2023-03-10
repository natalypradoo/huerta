import React, { useEffect,useState } from "react";
import {Link} from 'react-router-dom'
import * as API from '../../servicios/servicios'

export function ListaUsuarios(){
    const [usuarios,setUsuarios]=useState([]);
    
//para buscar usuaario

    const [username, setUsername]=useState('');
    const [nombre, setNombre]=useState('');
    const [apellido,setApellido]=useState('');
    const [mensajeError,setmensajeError]=useState('');

    
    useEffect(()=>{
        API.getUsuarios().then(setUsuarios)
    },[])

//funcion para buscar usuario
const buscar_usuario = ()=>{

    const filtros={
        username: username,
        nombre: nombre,
        apellido: apellido,
    };
   // console.log('le manda los filtros',filtros)
    API.BuscarUsuarios(filtros).then(setUsuarios);
   
}
const limpiar_filtros = ()=>{
    setApellido('');
    setNombre('');
    setUsername('');

    API.getUsuarios().then(setUsuarios)
   
}

//baja de Usuarios
const bajaUsuario  = async(id_usuario)=>{
    //console.log('id_usu:', id_usuario)
     const user = await API.BajaUsuarios(id_usuario)
     // const user = await API.bajaUsuario(id)
     if(user.status){
        setmensajeError(user.mensaje)
          setTimeout(()=>{
            setmensajeError('')
             window.location.reload(true)

          }, 4000)
     }else{
         setmensajeError(user.mensaje)
         setTimeout(()=>{
             setmensajeError('')
         }, 4000)
     }
}
//dar de alta
const altaUsuario  = async(id_usuario)=>{
    //console.log('id_usu:', id_usuario)
     const user = await API.AltaUsuarios(id_usuario)
     // const user = await API.bajaUsuario(id)
     if(user.status){
        setmensajeError(user.mensaje)
          setTimeout(()=>{
            setmensajeError('')
             window.location.reload(true)

          }, 4000)
     }else{
         setmensajeError(user.mensaje)
         setTimeout(()=>{
             setmensajeError('')
         }, 4000)
     }
}




    return(
    <>
            <div className="card">
                <div className="card-header">
                    Filtros de busqueda
                </div>
                <div className="card-body">
                    <div className='row'>
                        <div className='col-2'>
                            <label>Username </label>
                            <input 
                             id='username'
                             className='form-control'
                             value={username} 
                             onChange={(event)=>setUsername(event.target.value)}
                            />
                        </div>
                        <div className='col-2'>
                            <label>Nombre</label>
                            <input 
                             id='nombre'
                             className='form-control'
                             value={nombre} 
                             onChange={(event)=>setNombre(event.target.value)}
                            />

                        </div>
                        <div className='col-2'>
                            <label>Apellido </label>
                            <input 
                            id='apellido'
                             className='form-control'
                            value={apellido} 
                            onChange={(event)=>setApellido(event.target.value)}
                            />

                        </div>
                        <div className='col-1'>
                        </div>
                        <div className='col-2'>
                            <button onClick={buscar_usuario} className='btn btn-primary'>Buscar</button>
                        </div>
                        <div className='col-2'>
                            <button  onClick={limpiar_filtros} className='btn btn-dark'>Limpiar Filtros</button>                    
                        </div> 

                        
                    </div>

                    
                </div>
            </div> 
            <div className="card">
        <div className="card-header">
            Listado de Usuarios
        </div>
        <div className="card-body">
                {
                    mensajeError?
                        <div className="alert alert-success" role="alert">
                        {mensajeError}
                     </div>:''
                }
        <Link name="" id="" className="btn btn-light" to={'/registro'} role="button">Nuevo Usuario</Link>
            <table className="table table-striped table-inverse table-responsive">
                <thead className="thead-inverse">
                     <tr>
                        <th>id</th>
                        <th>Username</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                         <th>Email</th> 
                         <th>Acciones</th>
                     </tr>
                </thead>
                <tbody>
                    {usuarios.map((usuario)=>(
                            <tr>
                            <td scope="row">{usuario.id_usuario}</td>
                            <td scope="row">{usuario.username}</td>
                            <td scope="row"> {usuario.nombre}</td>
                            <td scope="row">{usuario.apellido}</td>

                            {(usuario.contacto=='SI')?
                            <>
                                <td scope="row">{usuario.email}</td>
                                </>
                                :
                                <>
                                <td scope="row">&nbsp;</td>
                                </> 
                            } 
                             
                            <td>
                            <td>
                            <div className="btn-group" role="group" aria-label="">
                            { (usuario.estado=='A')?
                                <>
                                <button onClick={() =>bajaUsuario(usuario.id_usuario)} type="button" className="btn btn-danger"> Dar de Baja </button>

                                </>
                                : 
                                <>
                                <button  onClick={() =>altaUsuario(usuario.id_usuario)} type="button" className="btn btn-success"> Dar de Alta </button>

                                </>
                            }
                            <button  type="button" className="btn btn-warning"> Modificar </button>

                        
                            </div>
                            </td>
                            {/* <div className="btn-group" role="group" aria-label="">
                                                    
                                                    { (usuario.contacto=='SI')?
                                                         <>
                                                         <Link to={'/contacto'}>
                                                            <button onClick={() =>bajaUsuario(usuario.id_usuario)} type="button" className="btn btn-secondary"> Contacto </button>
                                                         </Link> 
                                                          </> 
                                                          :
                                                          <>
                                                         </> 
                                                          }


                                                </div> */}
                                                </td>
                                                </tr>
                                                ))}
                    
                </tbody>
            </table>
        </div>
        </div>
        <div className="card-footer text-muted">
            Mi huera
        </div>

    </>
    )
};