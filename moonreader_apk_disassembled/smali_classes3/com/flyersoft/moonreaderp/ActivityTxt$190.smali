.class Lcom/flyersoft/moonreaderp/ActivityTxt$190;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doDayNightLongTap(ILandroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18485
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 18488
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string v2, "Day Theme"

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->loadTheme(Ljava/lang/String;Z)V

    :cond_0
    if-ne p1, v0, :cond_1

    .line 18490
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A;->NIGHT_THEME()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->loadTheme(Ljava/lang/String;Z)V

    :cond_1
    if-eqz p1, :cond_2

    if-ne p1, v0, :cond_3

    .line 18492
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-eqz v1, :cond_3

    .line 18493
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadWebView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_3
    const/4 v1, 0x2

    if-ne p1, v1, :cond_4

    .line 18496
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showThemeWindow()V

    :cond_4
    const/4 v1, 0x3

    if-ne p1, v1, :cond_5

    .line 18498
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityTxt$190$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$190$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$190;)V

    invoke-direct {p1, v1, v2, v0}, Lcom/flyersoft/moonreaderp/PrefTheme;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;Z)V

    .line 18504
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->show()V

    :cond_5
    return-void
.end method
