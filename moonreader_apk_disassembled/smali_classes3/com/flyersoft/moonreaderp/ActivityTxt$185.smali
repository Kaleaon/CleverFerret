.class Lcom/flyersoft/moonreaderp/ActivityTxt$185;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doFontSizeLongTap(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 18358
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    if-nez p1, :cond_0

    .line 18361
    sget-object p1, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getLocalFontfaces(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 18362
    sget-object p1, Lcom/flyersoft/tools/A;->localFontfaces:Ljava/util/ArrayList;

    sget-object v0, Lcom/flyersoft/tools/A;->localFontfaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    .line 18363
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185;->val$v:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->font_name:I

    .line 18364
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setTitle(I)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$185$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$185$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$185;[Ljava/lang/String;)V

    .line 18365
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    .line 18370
    invoke-virtual {p1}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void

    :cond_0
    const/4 v0, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    if-ne p1, v0, :cond_1

    .line 18374
    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    add-float/2addr v0, v1

    sput v0, Lcom/flyersoft/tools/A;->fontSize:F

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 18376
    sget p1, Lcom/flyersoft/tools/A;->fontSize:F

    sub-float/2addr p1, v1

    sput p1, Lcom/flyersoft/tools/A;->fontSize:F

    .line 18377
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$185;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setFontSize()V

    return-void
.end method
