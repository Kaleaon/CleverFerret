.class Lcom/flyersoft/moonreaderp/ActivityTxt$186;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doBookmarkLongTap(Landroid/view/View;)V
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

    .line 18393
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$186;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    if-nez p1, :cond_0

    .line 18396
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$186;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_bookmark()V

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 18398
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$186;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->createBookmark(Ljava/lang/String;ZZ)V

    :cond_1
    return-void
.end method
