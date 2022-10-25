import { createInterface } from 'readline'
import process from 'process'

function question(sentence: string): Promise<string> {
  const readLineInterface = createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: true,
  })
  return new Promise((resolve) => {
    readLineInterface.question(sentence, (userInput) => {
      resolve(userInput)
      readLineInterface.close()
    })
  })
}

export default question
