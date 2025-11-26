.class Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;
.super Ljava/lang/Object;
.source "PrefEditBookmark.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBookmark;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    goto :goto_0

    .line 102
    :cond_0
    sput p1, Lcom/flyersoft/tools/A;->bookmark_color:I

    .line 103
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorV:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 104
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorLay:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
