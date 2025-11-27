.class Lcom/radaee/annotui/UILStyleButton$2;
.super Ljava/lang/Object;
.source "UILStyleButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UILStyleButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UILStyleButton;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UILStyleButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 76
    iput-object p1, p0, Lcom/radaee/annotui/UILStyleButton$2;->this$0:Lcom/radaee/annotui/UILStyleButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 79
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleButton$2;->this$0:Lcom/radaee/annotui/UILStyleButton;

    invoke-static {p1}, Lcom/radaee/annotui/UILStyleButton;->access$000(Lcom/radaee/annotui/UILStyleButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->isShowing()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x2

    .line 80
    new-array p1, p1, [I

    .line 81
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleButton$2;->this$0:Lcom/radaee/annotui/UILStyleButton;

    invoke-virtual {v0, p1}, Lcom/radaee/annotui/UILStyleButton;->getLocationInWindow([I)V

    .line 82
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleButton$2;->this$0:Lcom/radaee/annotui/UILStyleButton;

    invoke-static {v0}, Lcom/radaee/annotui/UILStyleButton;->access$000(Lcom/radaee/annotui/UILStyleButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton$2;->this$0:Lcom/radaee/annotui/UILStyleButton;

    const/4 v2, 0x0

    aget v2, p1, v2

    invoke-virtual {v1}, Lcom/radaee/annotui/UILStyleButton;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/radaee/annotui/UILStyleButton$2;->this$0:Lcom/radaee/annotui/UILStyleButton;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v3, v4}, Lcom/radaee/annotui/UILStyleButton;->access$100(Lcom/radaee/annotui/UILStyleButton;F)I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x1

    aget p1, p1, v3

    invoke-virtual {v0, v1, v2, p1}, Lcom/radaee/annotui/UIAnnotPop;->show(Landroid/view/View;II)V

    :cond_0
    return-void
.end method
