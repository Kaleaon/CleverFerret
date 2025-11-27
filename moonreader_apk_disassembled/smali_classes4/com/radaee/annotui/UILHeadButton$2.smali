.class Lcom/radaee/annotui/UILHeadButton$2;
.super Ljava/lang/Object;
.source "UILHeadButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UILHeadButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UILHeadButton;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UILHeadButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 98
    iput-object p1, p0, Lcom/radaee/annotui/UILHeadButton$2;->this$0:Lcom/radaee/annotui/UILHeadButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 101
    iget-object p1, p0, Lcom/radaee/annotui/UILHeadButton$2;->this$0:Lcom/radaee/annotui/UILHeadButton;

    invoke-static {p1}, Lcom/radaee/annotui/UILHeadButton;->access$000(Lcom/radaee/annotui/UILHeadButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->isShowing()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x2

    .line 103
    new-array p1, p1, [I

    .line 104
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton$2;->this$0:Lcom/radaee/annotui/UILHeadButton;

    invoke-virtual {v0, p1}, Lcom/radaee/annotui/UILHeadButton;->getLocationInWindow([I)V

    .line 106
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton$2;->this$0:Lcom/radaee/annotui/UILHeadButton;

    invoke-static {v0}, Lcom/radaee/annotui/UILHeadButton;->access$000(Lcom/radaee/annotui/UILHeadButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton$2;->this$0:Lcom/radaee/annotui/UILHeadButton;

    const/4 v2, 0x0

    aget v2, p1, v2

    invoke-virtual {v1}, Lcom/radaee/annotui/UILHeadButton;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/radaee/annotui/UILHeadButton$2;->this$0:Lcom/radaee/annotui/UILHeadButton;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v3, v4}, Lcom/radaee/annotui/UILHeadButton;->access$100(Lcom/radaee/annotui/UILHeadButton;F)I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x1

    aget p1, p1, v3

    invoke-virtual {v0, v1, v2, p1}, Lcom/radaee/annotui/UIAnnotPop;->show(Landroid/view/View;II)V

    :cond_0
    return-void
.end method
