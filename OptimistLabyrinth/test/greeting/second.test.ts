import greeting from '../../src/greeting'

describe('print hello 2', () => {
  test('print hello with 1234', () => {
    const greetingMessage = greeting.run('1234')
    expect(greetingMessage).toBe('hello 1234')
  })
})
