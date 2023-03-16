<?php
require_once __DIR__ . "/config/db.php";

$conn = mysqli_connect($db_host, $db_user, $db_password, $db_name);

if (!$conn) {
    die("Erro ao conectar ao banco de dados: " . mysqli_connect_error());
}

$sql = "SELECT Tb_banco.nome nome_do_banco,
            Tb_convenio.verba, 
            Tb_contrato.codigo codigo_do_contrato, 
            Tb_contrato.data_inclusao data_de_inclusao, 
            Tb_contrato.valor, 
            Tb_contrato.prazo 
        FROM Tb_contrato 
        INNER JOIN Tb_convenio_servico ON Tb_contrato.convenio_servico = Tb_convenio_servico.codigo 
        INNER JOIN Tb_convenio ON Tb_convenio_servico.convenio = Tb_convenio.codigo 
        INNER JOIN Tb_banco ON Tb_convenio.banco = Tb_banco.codigo";

$result = mysqli_query($conn, $sql);

if (!$result) {
    $error = mysqli_error($conn);
    mysqli_close($conn);
    die("Erro ao consultar o banco de dados: " . $error);
}

echo "<table>";
echo "<tr'><th>Nome do Banco</th><th>Verba</th><th>Código do Contrato</th><th>Data de Inclusão</th><th>Valor</th><th>Prazo</th></tr>";
if (mysqli_num_rows($result) > 0) {
    foreach ($result as $row) {
        echo "<tr>";
        echo "<td>" . $row['nome_do_banco'] . "</td>";
        echo "<td>" . $row['verba'] . "</td>";
        echo "<td>" . $row['codigo_do_contrato'] . "</td>";
        echo "<td>" . $row['data_de_inclusao'] . "</td>";
        echo "<td>" . $row['valor'] . "</td>";
        echo "<td>" . $row['prazo'] . "</td>";
        echo "</tr>";
    }
}
echo "</table>";

mysqli_close($conn);

?>