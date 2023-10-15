// typescript : класс, метод, export, static

export class Challenge
{
    static solution(number:number) : number
    {
        if(number <= 0)
        {
            return 0;
        }
        let sum : number = 0;
        for(let i: number = 1; i < number; i++)
        {
            if(i % 3 == 0)
            {
                sum += i;
            }
            else if(i % 5 == 0)
            {
                sum += i;
            }
        }
        return sum;
    }
}

console.log(Challenge.solution(10));
console.log(Challenge.solution(0));
console.log(Challenge.solution(-9));
console.log(Challenge.solution(99));