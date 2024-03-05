part of '../main_screen.dart';

class _DesktopNavigationBar extends StatefulWidget {
  const _DesktopNavigationBar({Key? key}) : super(key: key);

  @override
  State<_DesktopNavigationBar> createState() => _DesktopNavigationBarState();
}

class _DesktopNavigationBarState extends State<_DesktopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
        color: theme.navigationBarColor,
        child: Row(
          children: <Widget>[
            const NavigationBarLogo(),
            const Expanded(child: SizedBox(width: double.infinity)),
            ...NavBarUtils.names.asMap().entries.map(
                  (MapEntry<int, String> entry) => NavBarActionButton(
                    label: entry.value,
                    index: entry.key,
                  ),
                ),
            InkWell(
                onTap: () {
                  context.read<ThemeCubit>().updateTheme(!state.isDarkThemeOn);
                },
                child: Image.network(
                  state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                  height: 30,
                  width: 30,
                  color: state.isDarkThemeOn ? Colors.black : Colors.white,
                )),
          ],
        ),
      );
    });
  }
}

class _NavBarTablet extends StatelessWidget {
  const _NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final drawerProvider = Provider.of<DrawerProvider>(context);
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.navigationBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
      child: Row(
        children: <Widget>[
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              //drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          //Space.xm!,
          const NavigationBarLogo(),
        ],
      ),
    );
  }
}