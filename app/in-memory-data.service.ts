export class InMemoryDataService {
  createDb() {

    let companies = [
      {
        id: 3,
        name: 'Microsoft',
        email: 'opensource@microsoft.com',
        url: 'https://github.com/microsoft',
        avatar_url: 'https://avatars.githubusercontent.com/u/6154722?v=3',
        description: 'Open source, from Microsoft with love',
        project_ids: [3]
      },
      {
        id: 2,
        name: 'Facebook',
        email: null,
        url: 'https://github.com/facebook',
        avatar_url: 'https://avatars.githubusercontent.com/u/69631?v=3',
        description: 'We work hard to contribute our work back to the web, mobile, big data, & infrastructure communities. NB: members must have two-factor auth.'
        project_ids: [2]
      },
      {
        id: 1,
        name: 'Google',
        email: null,
        url: 'https://github.com/google',
        avatar_url: 'https://avatars.githubusercontent.com/u/1342004?v=3',
        description: null,
        project_ids: [1]
      }
    ];

    let projects = [
      {
        id: 1,
        name: 'upb',
        url: 'https://github.com/google/upb',
        createdDate: 'Sat, 09 May 2009 02:38:42 GMT',
        private: false,
        description: 'small, fast parsers for the 21st century',
        language_ids: [1, 4, 5, 6],
        contributor_ids: [1],
        owner_id: 1
      },
      {
        id: 2,
        name: 'codemod',
        url: 'https://github.com/facebook/codemod',
        createdDate: 'Thu, 02 Apr 2009 04:51:54 GMT',
        private: false,
        description: 'Codemod is a tool/library to assist you with large-scale codebase refactors that can be partially automated but still require human oversight and occasional intervention. Codemod was developed at Facebook and released as open source.',
        language_ids: [1],
        contributor_ids: [2],
        owner_id: 2
      },
      {
        id: 3,
        name: 'protractor',
        url: 'https://github.com/Microsoft/protractor',
        createdDate: 'Fri, 25 Oct 2013 12:35:40 GMT',
        private: false,
        description: 'HTML5 application for Windows Phone that allows the screen to be used as protractor/ruler to measure lengths and angles.',
        language_ids: [3, 7],
        contributor_ids: [3],
        owner_id: 3
      }
    ];

    let contributors = [
      {
        id: 1,
        username: 'haberman',
        email: 'jhaberman@gmail.com',
        url: 'https://github.com/haberman',
        avatar_url: 'https://avatars.githubusercontent.com/u/1270?v=3',
        location: 'Seattle, WA',
        project_ids: [1]
      },
      {
        id: 2,
        username: 'modocache',
        email: 'modocache@gmail.com',
        url: 'https://github.com/modocache',
        avatar_url: 'https://avatars.githubusercontent.com/u/552921?v=3',
        location: 'Brooklyn, NY',
        project_ids: [2]
      },
      {
        id: 3,
        username: 'tompaana',
        email: null,
        url: 'https://github.com/tompaana',
        avatar_url: 'https://avatars.githubusercontent.com/u/1629215?v=3',
        location: 'Tampere, Finland',
        project_ids: [3]
      }
    ];

    let languages = [
      {
        id: 1,
        name: 'python',
        creator: 'Guido van Rossum',
        type: 'Interpreted',
        firstAppeared: 1991,
        description: 'Python is a widely used high-level, general-purpose, interpreted, dynamic programming language. Its design philosophy emphasizes code readability, and its syntax allows programmers to express concepts in fewer lines of code than possible in languages such as C++ or Java. The language provides constructs intended to enable writing clear programs on both a small and large scale.',
        paradigms: ['Object Oriented','Functional'],
        project_ids: [1,2]
      },
      {
        id: 2,
        name: 'java',
        creator: 'James Gosling',
        type: 'Compiled',
        firstAppeared: 1995,
        description: 'Java is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers \'write once, run anywhere\' (WORA), meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.',
        paradigms: ['Object Oriented','Imperative']
      },
      {
        id: 3,
        name: 'javascript',
        creator: 'Brendan Eich',
        type: 'Interpreted',
        firstAppeared: 1995,
        description: 'JavaScript is a high-level, dynamic, untyped, and interpreted programming language. It has been standardized in the ECMAScript language specification. Alongside HTML and CSS, it is one of the three core technologies of World Wide Web content production; the majority of websites employ it and it is supported by all modern Web browsers without plug-ins.',
        paradigms: ['Functional', 'Imperative','Object Oriented'],
        project_ids: [3]
      },
      {
        id: 4,
        name: 'c',
        creator: 'Dennis Ritchie',
        type: 'Compiled',
        firstAppeared: 1972,
        description: 'C is a general-purpose, imperative computer programming language, supporting structured programming, lexical variable scope and recursion, while a static type system prevents many unintended operations. By design, C provides constructs that map efficiently to typical machine instructions, and therefore it has found lasting use in applications that had formerly been coded in assembly language, including operating systems, as well as various application software for computers ranging from supercomputers to embedded systems.',
        paradigms: ['Imperative'],
        project_ids: [1]
      },
      {
        id: 5,
        name: 'c++',
        creator: 'Bjarne Stroustrup',
        type: 'Compiled',
        firstAppeared: 1983,
        description: 'C++ is a general-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing facilities for low-level memory manipulation. It was designed with a bias toward system programming and embedded, resource-constrained and large systems, with performance, efficiency and flexibility of use as its design highlights. C++ has also been found useful in many other contexts, with key strengths being software infrastructure and resource-constrained applications, including desktop applications, servers, and performance-critical applications.',
        paradigms: ['Functional','Imperative','Object Oriented'],
        project_ids: [1]
      },
      {
        id: 6,
        name: 'ruby',
        creator: 'Yukihiro Matsumoto',
        type: 'Interpreted',
        firstAppeared: 1995,
        description: 'Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro \'Matz\' Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.',
        paradigms: ['Imperative','Object Oriented','Functional'],
        project_ids: [1]
      },
      {
        id: 7,
        name: 'c#',
        creator: 'Microsoft',
        type: 'Compiled',
        firstAppeared: 2000,
        description: 'C# is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented , and component-oriented programming disciplines. It was developed by Microsoft within its .NET initiative and later approved as a standard by Ecma (ECMA-334) and ISO (ISO/IEC 23270:2006). C# is one of the programming languages designed for the Common Language Infrastructure.',
        paradigms: ['Functional','Imperative','Object Oriented'],
        project_ids: [3]
      }
    ];

    return { companies, projects, contributors, languages }
  }
}
