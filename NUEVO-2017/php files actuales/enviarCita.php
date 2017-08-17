<?php


$nombre_usuario = $_POST['a'];
$email_usuario = $_POST['b'];
$tel_usuario = $_POST['c'];
$modelo = $_POST['d'];
$ano = $_POST['e'];

$km = $_POST['f'];
$tipo = $_POST['g'];
$fecha = $_POST['h'];
$hora = $_POST['i'];
$comentarios = $_POST['j'];
$codigo = $_POST['k'];
$agencia = $_POST['l'];
$email_taller = $_POST['m'];
$email_asesor = $_POST['n'];




    $host='localhost';
    $user='miasesor_app';
     $db='miasesor_app';
    $password='';

$link = mysqli_connect("localhost","miasesor_app","Papa020432","miasesor_app");

mysqli_query($link,"INSERT INTO tb_citas_servicio (`nombre_cliente`,`email_cliente`,`cel_cliente`,
`modelo`,`ano`,
`kilometros`,`tipo`,
`fecha`,`hora`,
`comentarios`,`codigo`,
`agencia_cita`)
VALUES ('$nombre_usuario','$email_usuario','$tel_usuario',
'$modelo','$ano',
'$km' ,'$tipo',
'$fecha','$hora',
'$comentarios','$codigo',
'$agencia')") 
or die(mysqli_error($link));
   


$to = $email_taller;
$subject = '(EMAIL AL TALLER) Cita a Servicio '.$codigo.'  desde la app Mi Asesor Automotriz (iOS)';
$from = 'Mi Asesor Automotriz';
 
// To send HTML mail, the Content-type header must be set
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
 
// Create email headers
$headers .= 'From: '.$from."\r\n".
    'Reply-To: '.$from."\r\n" .
    'X-Mailer: PHP/' . phpversion();
 
// Compose a simple HTML email message
$message = '<html><body>';
$message .= '<h1 style="color:#f40;">Hola '.$nombre_usuario.'!</h1>';
$message .= '<p style="color:#080;font-size:18px;">Esto es una CITA A SERVICIO creada desde la App MI ASESOR AUTOMOTRIZ</p>';
$message .= '<p>Cliente: '.$nombre_usuario.'</p>';
$message .= '<p>Email del Cliente: '.$email_usuario.'</p>';
$message .= '<p>Teléfono del Cliente: '.$tel_usuario.'</p>';
$message .= '<p>Auto: '.$modelo.'</p>';
$message .= '<p>Año: '.$ano.'</p>';
$message .= '<p>Kilómetros: '.$km.'</p>';
$message .= '<p>Tipo de cita: '.$tipo.'</p>';
$message .= '<p>Fecha de la cita: '.$fecha.'</p>';
$message .= '<p>Hora de la cita: '.$hora.'</p>';
$message .= '<p>Comentarios del cliente: '.$comentarios.'</p>';
$message .= '<p>Código de la cita: '.$codigo.'</p>';
$message .= '<p>Gracias por su confianza. En breve nos pondremos en contacto con usted</p>';


$message .= '</body></html>';
 
// Sending email
if(mail($to, $subject, $message, $headers)){
    echo 'Your mail has been sent successfully.';
} else{
    echo 'Unable to send email. Please try again.';
}

$to = $email_usuario;
$subject = '(EMAIL AL CLIENTE) Cita a Servicio '.$codigo.'  desde la app Mi Asesor Automotriz (iOS)';
$from = 'Mi Asesor Automotriz';
 
// To send HTML mail, the Content-type header must be set
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
 
// Create email headers
$headers .= 'From: '.$from."\r\n".
    'Reply-To: '.$from."\r\n" .
    'X-Mailer: PHP/' . phpversion();
 
// Compose a simple HTML email message
$message = '<html><body>';
$message .= '<h1 style="color:#f40;">Hola '.$nombre_usuario.'!</h1>';
$message .= '<p style="color:#080;font-size:18px;">Esto es una CITA A SERVICIO creada desde la App MI ASESOR AUTOMOTRIZ</p>';
$message .= '<p>Cliente: '.$nombre_usuario.'</p>';
$message .= '<p>Email del Cliente: '.$email_usuario.'</p>';
$message .= '<p>Teléfono del Cliente: '.$tel_usuario.'</p>';
$message .= '<p>Auto: '.$modelo.'</p>';
$message .= '<p>Año: '.$ano.'</p>';
$message .= '<p>Kilómetros: '.$km.'</p>';
$message .= '<p>Tipo de cita: '.$tipo.'</p>';
$message .= '<p>Fecha de la cita: '.$fecha.'</p>';
$message .= '<p>Hora de la cita: '.$hora.'</p>';
$message .= '<p>Comentarios del cliente: '.$comentarios.'</p>';
$message .= '<p>Código de la cita: '.$codigo.'</p>';
$message .= '<p>Gracias por su confianza. En breve nos pondremos en contacto con usted</p>';


$message .= '</body></html>';
 
// Sending email
if(mail($to, $subject, $message, $headers)){
    echo 'Your mail has been sent successfully.';
} else{
    echo 'Unable to send email. Please try again.';
}

$to = $email_asesor;
$subject = '(EMAIL AL ASESOR) Cita a Servicio '.$codigo.' desde la app Mi Asesor Automotriz (iOS)';
$from = 'Mi Asesor Automotriz';
 
// To send HTML mail, the Content-type header must be set
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
 
// Create email headers
$headers .= 'From: '.$from."\r\n".
    'Reply-To: '.$from."\r\n" .
    'X-Mailer: PHP/' . phpversion();
 
// Compose a simple HTML email message
$message = '<html><body>';
$message .= '<h1 style="color:#f40;">Hola '.$nombre_usuario.'!</h1>';
$message .= '<p style="color:#080;font-size:18px;">Esto es una CITA A SERVICIO creada desde la App MI ASESOR AUTOMOTRIZ</p>';
$message .= '<p>Cliente: '.$nombre_usuario.'</p>';
$message .= '<p>Email del Cliente: '.$email_usuario.'</p>';
$message .= '<p>Teléfono del Cliente: '.$tel_usuario.'</p>';
$message .= '<p>Auto: '.$modelo.'</p>';
$message .= '<p>Año: '.$ano.'</p>';
$message .= '<p>Kilómetros: '.$km.'</p>';
$message .= '<p>Tipo de cita: '.$tipo.'</p>';
$message .= '<p>Fecha de la cita: '.$fecha.'</p>';
$message .= '<p>Hora de la cita: '.$hora.'</p>';
$message .= '<p>Comentarios del cliente: '.$comentarios.'</p>';
$message .= '<p>Código de la cita: '.$codigo.'</p>';
$message .= '<p>Gracias por su confianza. En breve nos pondremos en contacto con usted</p>';


$message .= '</body></html>';
 
// Sending email
if(mail($to, $subject, $message, $headers)){
    echo 'Your mail has been sent successfully.';
} else{
    echo 'Unable to send email. Please try again.';
}
echo 'Successfully addedlo.'.$tipo;


?>
