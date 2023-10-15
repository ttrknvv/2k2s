import React from "react";
import IUser from "../types/types" 

interface UserListProps {
    users: IUser[],
    children? : React.ReactNode | React.ReactChild
}

const UserList = ({users, children} : UserListProps) => {
    return(<div>
        {users.map(user => <div key={user.id} style={{padding: '15px', border: '1px solid black'}}>
            {user.id}. {user.name}
            </div>)}
    </div>);
};

export default UserList;