.class public Lcom/flyersoft/moonreaderp/MyActionBarActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MyActionBarActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 3

    .line 35
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_2

    .line 36
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    .line 38
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    const-string v1, "options1002"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "languageID2"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->languageID:I

    .line 40
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->languageID:I

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->wrapLanguage(Landroid/content/Context;)Landroid/content/ContextWrapper;

    move-result-object p1

    :goto_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->attachBaseContext(Landroid/content/Context;)V

    return-void

    .line 42
    :cond_2
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->attachBaseContext(Landroid/content/Context;)V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 48
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/A;->screenChangedTime:J

    .line 50
    sget-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->sysHasDynamicColors:Z

    if-eqz p1, :cond_0

    .line 51
    invoke-static {p0}, Lcom/flyersoft/tools/C;->initDynamicColors(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 19
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 20
    sget-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz p1, :cond_0

    .line 21
    sget p1, Lcom/flyersoft/moonreaderp/R$style;->MRThemeSelector_ink:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->setTheme(I)V

    .line 23
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/CrashHandler;->getInstance()Lcom/flyersoft/components/CrashHandler;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/flyersoft/components/CrashHandler;->init(Landroid/app/Activity;)V

    const/4 p1, 0x1

    .line 24
    invoke-static {p1}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 29
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 30
    invoke-static {}, Lcom/flyersoft/components/CrashHandler;->getInstance()Lcom/flyersoft/components/CrashHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/CrashHandler;->init(Landroid/app/Activity;)V

    return-void
.end method
