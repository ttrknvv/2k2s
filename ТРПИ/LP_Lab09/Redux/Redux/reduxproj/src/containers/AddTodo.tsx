import React from 'react';
import { connect } from 'react-redux';
import { addTodo } from '../action/actions';

const AddTodo = ({ dispatch } : { dispatch : any }) => {
  let input : HTMLInputElement | null; // добавляем форму для добавления списка дел
  return (
    <div style={{textAlign: "center"}}>
      <form onSubmit={(e) => {
        e.preventDefault(); // предотвращение стандартного поведения отправки формы
        if (!input?.value.trim()) { // если поле пустое, то выходим
          return;
        }
        
        dispatch(addTodo(input?.value)); // отправка действия приложению и изменение его состояния

        if(input !== null)
          input.value = '';
      }}>
        <input placeholder='To do....' ref={(node) => (input = node)} />
        <button type="submit">Add Todo</button>
      </form>
    </div>
    )
};

export default connect()(AddTodo); // соединяет компонет со store