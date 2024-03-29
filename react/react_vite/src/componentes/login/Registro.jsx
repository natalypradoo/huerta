import { useState } from 'react'
import { Link } from 'react-router-dom'
import * as API from '../../servicios/servicios' 

export function Registro(){
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [nombre, setNombre] = useState('');
    const [apellido, setApellido] = useState('');
    const [email, setEmail] = useState('');
    const [fecha_nacimiento, setFechaNacimiento] = useState('');
    const [contacto, setContacto] = useState('');
    const [mensajeSuccess, setmensajeSuccess] = useState('');
    const [mensajeError, setmensajeError] = useState('');


   const registroForm  = async (event)=>{
    event.preventDefault();
      const user = await API.Registro({username, password, nombre, apellido, email, fecha_nacimiento, contacto})
  if(user.status){
          setmensajeSuccess(user.mensaje)
         setTimeout(()=>{
               setmensajeSuccess('');
         }, 4000)
         
         // window.location.reload(true)
     }else{
       setmensajeError(user.mensaje)
          setmensajeError(user)
         setTimeout(()=>{
               setmensajeError('');
          }, 4000)
         
     }
   }
  
    return(
        <>
        <div className="container">
          
        <div className="card">
            <div className="card-header">
                Crear Usuario
            </div>
            <div className="card-body">
              <form onSubmit={registroForm}> 
                {
                    mensajeSuccess?
                    <div className="alert alert-success" role="alert">
                    {mensajeSuccess}
                    </div>:''
                }
                {
                    mensajeError?
                        <div className="alert alert-danger" role="alert">
                        {mensajeError}
                     </div>:''
                }


                  <div className='row'>
                  <div className='col-6'>
                  <div className="form-group">
                  <label for="">Nombre Usuario</label>
                  <input required
                  type="text" 
                  value={username} 
                  className="form-control" 
                  placeholder="Nombre del Usuario" 
                  onChange={(event)=>setUsername(event.target.value)} />

                </div>

                  </div>
                  <div className='col-6'>
                  <div className="form-group">
                  <label for="">Password</label>
                  <input required
                  type="password" 
                  value={password} 
                  className="form-control" 
                  placeholder="Password" 
                  onChange={(event)=>setPassword(event.target.value)} />
                </div>

                  </div>
                </div>

                <div className="form-group">
                  <label for="">Email</label>
                  <input required
                  type="email" 
                  value={email} 
                  className="form-control" 
                  placeholder="Correo Electronico" 
                  onChange={(event)=>setEmail(event.target.value)} />
                </div>



                <div className='row'>
                  <div className='col-6'>
                  <div className="form-group">
                  <label for="">Nombre</label>
                  <input 
                  type="text" required
                  value={nombre} 
                  className="form-control" 
                  placeholder="Nombre" 
                  onChange={(event)=>setNombre(event.target.value)} />
                </div>
                  </div>
                  <div className='col-6'>
                  <div className="form-group">
                  <label for="">Apellido</label>
                  <input required
                  type="apellido" 
                  value={apellido} 
                  className="form-control" 
                  placeholder="Apellido" 
                  onChange={(event)=>setApellido(event.target.value)} />
                </div>
                  </div>
                </div>


                <div className='row'>
                  <div className='col-6'>
                  <div className="form-group">
                  <label for="">Fecha Nacimiento</label>
                  <input 
                  type="date"
                   value={fecha_nacimiento} 
                   onChange={(event)=>setFechaNacimiento(event.target.value)}
                  name="" id="" className="form-control" placeholder="" aria-describedby="helpId"/>

                  </div>
                  </div>
                  <div className='col-6'>
                  <div className="form-group">
                  <label for="">¿Quiere divulgar su email como contacto?</label>
                        <select 
                        onChange={(event)=>setContacto(event.target.value)} 
                        className='form-control'>
                        <option>Seleccionar filtro</option>
                        <option value='SI'>SI</option>
                        <option value='NO'>NO</option>
                        </select>

                  </div>
                  </div>
                </div>




                <div className="form-group">
                   <Link to={"/login"}><button onClick={registroForm} type="button" className="btn btn-primary">Guardar</button></Link> 
                   <small id="helpId" className="text-muted">&nbsp;</small>
                   <small id="helpId" className="text-muted">&nbsp;</small>
                    <Link to={'/'}><button type="button" className="btn btn-dark">Volver</button></Link>
                </div>
              </form>
                
            </div>
            
            <div className="card-footer text-muted">
               Mi Huerta
            </div>
        </div>
        <small id="helpId" className="text-muted">&nbsp;</small>
        </div>
        </>
    )
};