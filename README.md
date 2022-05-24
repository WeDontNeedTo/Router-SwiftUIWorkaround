# Router-SwiftUIWorkaround
Workaround for https://www.swiftuiseries.com/workarounds


https://user-images.githubusercontent.com/59708377/170004683-737cb7ef-7f48-47d7-9fbf-872d0c49bcbd.mov

## About

SwiftUI does not allow programmable screen navigation out of the box, has many bugs and limited screen manipulation capabilities. This repository provides a workaround to use routing programmatically.

## Steps to use

1. Configure routes
Use enum for routes and dont forget to choose screens with NavigationView!
```swift
enum ScreenRoute: ScreenProtocol {
    case start
    case navigator
    case fullScreen
    case sheetScreen
    
    var embedInNavView: Bool {
        switch self {
        case .start, .sheetScreen:
            return true
        case .navigator, .fullScreen:
            return false
        }
    }
}
```
2. Create router factory.
This class maps routes and creates views.
```swift
class ScreenRouterFactory: RouterFactory {
    
    @ViewBuilder func makeBody(for screen: ScreenRoute) -> some View {
        switch screen {
        case .start:
            StartingView()
        case .navigator:
            RoutesView()
        case .fullScreen:
            FullScreenView()
        case .sheetScreen:
            SheetView()
        }
    }
}
```
3. (? optional) Create typealias for easy naming Routers.

```swift
typealias ScreenRouter = Router<ScreenRoute, ScreenRouterFactory>
```

4. Create Router instance.
You can create in Views, ViewModels or use in DI. Don't forget to use @StateObject or similar wrappers in views for re-render
```swift
let screenRouter = ScreenRouter(rootScreen: .start, factory: ScreenRouterFactory())
```
5. Use it! Start routing with start method.
In this example EnvObject used:

```swift
struct MainView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        screenRouter.start()
    }
}
```
6. Available Router's methods:

```swift
func start() -> some View
func presentSheet(_ screen: ScreenType)
func dismissLast()
func navigateTo(_ screen: ScreenType)
func presentFullScreen(_ screen: ScreenType)
func popToRoot()
```
