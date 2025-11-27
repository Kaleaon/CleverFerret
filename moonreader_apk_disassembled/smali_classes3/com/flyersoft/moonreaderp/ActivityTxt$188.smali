.class Lcom/flyersoft/moonreaderp/ActivityTxt$188;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doAutoScrollLongTap(Landroid/view/View;)V
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

    .line 18427
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$188;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 18429
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$188;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    if-eqz p1, :cond_1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x5

    .line 18434
    sput p1, Lcom/flyersoft/tools/A;->autoScrollMode:I

    .line 18435
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$188;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSpeedRead(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    :cond_1
    :goto_0
    if-nez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    const/4 p1, 0x4

    .line 18431
    :goto_1
    sput p1, Lcom/flyersoft/tools/A;->autoScrollMode:I

    .line 18432
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$188;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_AutoScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void

    .line 18438
    :cond_3
    sput p1, Lcom/flyersoft/tools/A;->autoScrollMode:I

    .line 18439
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$188;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_AutoScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
