.class Lcom/flyersoft/moonreaderp/ActivityMain$31;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3286
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$31;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 9

    .line 3288
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_0

    const/16 v0, 0x64

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    new-array v2, v0, [Ljava/lang/CharSequence;

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v0, :cond_1

    .line 3290
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 3291
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "<small>"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ". "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$31;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 3292
    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v8

    invoke-static {v7, v4, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetBookName(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "</small>"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3291
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    aput-object v4, v2, v3

    move v3, v6

    goto :goto_1

    .line 3294
    :cond_1
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$31;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v3}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "<b>"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$31;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->recent_list:I

    .line 3295
    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "</b>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/MyMenu;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityMain$31$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$31$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$31;)V

    .line 3296
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$31;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->baseFrame:Landroid/widget/FrameLayout;

    .line 3300
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v2

    sget-boolean v3, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v3, :cond_2

    const/16 v3, 0x23

    goto :goto_2

    :cond_2
    sget-boolean v3, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v3, :cond_3

    const/16 v3, 0x2d

    goto :goto_2

    :cond_3
    const/16 v3, 0x37

    :goto_2
    mul-int v2, v2, v3

    div-int/2addr v2, v1

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyMenu;->setForceWidth(I)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 3301
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1
.end method
