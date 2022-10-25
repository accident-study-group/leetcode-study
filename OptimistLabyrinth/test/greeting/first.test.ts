import greeting from '../../src/greeting'

describe('print hello', () => {
  test('print hello with abcd', () => {
    const greetingMessage = greeting.run('abcd')
    expect(greetingMessage).toBe('hello abcd')
  })
})
