.class Lcom/flyersoft/moonreaderp/PrefShelf$3;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 184
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 187
    sput-boolean p2, Lcom/flyersoft/tools/A;->amoled:Z

    const/4 p1, 0x1

    .line 188
    sput-boolean p1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    .line 189
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    invoke-static {p2}, Lcom/flyersoft/tools/A;->forceDayTextColors(Landroid/view/View;)V

    .line 190
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    invoke-static {p2}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 191
    sget-object p2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 192
    sget-object p2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateMainTheme(Z)V

    .line 193
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefShelf;->preAmoled:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eq p2, v0, :cond_1

    .line 194
    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->doAmoledChanged(Z)V

    .line 195
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->setLanguageList(Landroid/widget/Spinner;Landroid/content/Context;)V

    .line 196
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    sget p2, Lcom/flyersoft/tools/A;->languageID:I

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 198
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    if-eqz p1, :cond_2

    .line 199
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->forceDayTextColors(Landroid/view/View;)V

    .line 200
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 202
    :cond_2
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_3

    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-nez p1, :cond_3

    .line 203
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A;->NIGHT_THEME()Ljava/lang/String;

    move-result-object p2

    sget-boolean v0, Lcom/flyersoft/tools/A;->loadThemeWithColorOnly:Z

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->loadTheme(Ljava/lang/String;Z)V

    :cond_3
    return-void
.end method
