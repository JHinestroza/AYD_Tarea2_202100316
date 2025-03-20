import Button from "../components/button"; // Asegúrate de que la primera letra es mayúscula

export default function Info() {
  return (
    <div className="flex flex-col items-center justify-center h-screen">
      <Button
        text="Informacion"
        onClick={() =>
          alert("Jose Andres Hinestroza Garcia \n202100316 \nAnalisis y Diseno")
        }
      />
    </div>
  );
}
