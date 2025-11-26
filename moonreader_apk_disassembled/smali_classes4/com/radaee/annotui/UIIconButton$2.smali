.class Lcom/radaee/annotui/UIIconButton$2;
.super Ljava/lang/Object;
.source "UIIconButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIIconButton;->init_text()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIIconButton;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIIconButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lcom/radaee/annotui/UIIconButton$2;->this$0:Lcom/radaee/annotui/UIIconButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 157
    iget-object p1, p0, Lcom/radaee/annotui/UIIconButton$2;->this$0:Lcom/radaee/annotui/UIIconButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIIconButton;->access$000(Lcom/radaee/annotui/UIIconButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->isShowing()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x2

    .line 159
    new-array p1, p1, [I

    .line 160
    iget-object v0, p0, Lcom/radaee/annotui/UIIconButton$2;->this$0:Lcom/radaee/annotui/UIIconButton;

    invoke-virtual {v0, p1}, Lcom/radaee/annotui/UIIconButton;->getLocationInWindow([I)V

    .line 162
    iget-object v0, p0, Lcom/radaee/annotui/UIIconButton$2;->this$0:Lcom/radaee/annotui/UIIconButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIIconButton;->access$000(Lcom/radaee/annotui/UIIconButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIIconButton$2;->this$0:Lcom/radaee/annotui/UIIconButton;

    const/4 v2, 0x0

    aget v2, p1, v2

    invoke-virtual {v1}, Lcom/radaee/annotui/UIIconButton;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/radaee/annotui/UIIconButton$2;->this$0:Lcom/radaee/annotui/UIIconButton;

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-static {v3, v4}, Lcom/radaee/annotui/UIIconButton;->access$100(Lcom/radaee/annotui/UIIconButton;F)I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x1

    aget p1, p1, v3

    invoke-virtual {v0, v1, v2, p1}, Lcom/radaee/annotui/UIAnnotPop;->show(Landroid/view/View;II)V

    :cond_0
    return-void
.end method
