.class Lcom/radaee/annotui/UIIconButton$1;
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

    .line 44
    iput-object p1, p0, Lcom/radaee/annotui/UIIconButton$1;->this$0:Lcom/radaee/annotui/UIIconButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/radaee/annotui/UIIconButton$1;->this$0:Lcom/radaee/annotui/UIIconButton;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/annotui/UIIconButton;->setIcon(I)V

    .line 48
    iget-object p1, p0, Lcom/radaee/annotui/UIIconButton$1;->this$0:Lcom/radaee/annotui/UIIconButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIIconButton;->access$000(Lcom/radaee/annotui/UIIconButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->dismiss()V

    return-void
.end method
