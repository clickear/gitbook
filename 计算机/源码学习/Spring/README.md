#  [Spring](<https://www.processon.com/view/link/5cb6c8a4e4b059e209fbf369#outline>)

## Spring Framework

### 整体认知spring 体系结构

### 理解Spring IOC 容器设计原理

### 掌握Bean生命周期

#### 初始化InitializingBean/@PostConstruct

#### Bean的后置处理器BeanPostProcessor源码分析

#### 销毁DisposableBean/@PreDestroy

### Spring Context 装载过程源码分析

#### BeanFactoryPostProcessor源码分析

#### BeanDefinitionRegistryPostProcessor源码分析

### Factorybean与Beanfactory区别

## Spring MVC

### 理解MVC设计思想

### 从DispatchServlet 出发 讲述MVC体系结构组成

### 基于示例展开DispatchServlet 核心类结构

### MVC执行流程讲解

### RequestMaping 实现原理 

### MVC初始化过程源码深度解读

#### 熟悉MVC组件体系

#### 映射器原理实现

#### 执行适配器原理实现

#### 视图解析器原理实现

#### 异常捕捉器原理实现

### Spring Aop

### 深入理解AOP的底层实现

### 掌握Spring AOP 编程概念

### AOP注解编程

#### @EnableAspectJAutoProxy

#### @Before/@After/@AfterReturning/@AfterThrowing/@Around

#### @Pointcut

### 基于Spring AOP 实现应用插件机制

### Spring  AOP源码分析

#### ProxyFactory源码解析

#### AOP代理源码解析

###### JdkDynamicAopProxy

###### Cglib2AopProxy

#### 拦截器链与织入源码解析

###### Advice

###### Interceptor

#### Spring事务控制与底层源码分析

###### @EnableTransactionManagement

###### @Transactional

## Spring注解式开发

#### @ComponentScan

#### @Bean

#### @Configuration

#### @Component/@Service@/Controller/@Repository

#### @Conditional

#### @Lazy

#### @Scope

#### @Import

#### @Value

#### @Autowired/@Resources/@Inject

#### @Profile

## Spring 5新特性

### 新特性详解

### 响应式编程模型

### 函数式风格的ApplicationContext

### Kotlin表达式的支持

### SpringWebFlux模块讲解