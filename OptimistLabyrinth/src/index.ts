import dotenv from 'dotenv'
import greeting from './greeting'
import greetingJs from './greetingJs'
import question from './utils/question'
dotenv.config()

main()

async function main() {
  console.log('hello world')
  const answer = await question('네 이름이 뭐니?? ')
  console.log('응답:', answer)
  const greetingMessage = greeting.run(answer)
  console.log(greetingMessage)
  const grettingJsMessage = greetingJs.run(answer)
  console.log(grettingJsMessage)
}
