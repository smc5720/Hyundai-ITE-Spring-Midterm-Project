import React, {useEffect} from 'react';
import axios from "axios";

const BoardList: React.FC = () => {
    useEffect(() => {
        getBoardList();
    }, []);

    const getBoardList = async () => {
        // res는 http response의 header + body를 모두 갖고 있다.
        const res  = await axios.get('http://localhost:8080/api/boards');
        console.log(res);
    }

    return (
        <div>
            
        </div>
    );
};

export default BoardList;