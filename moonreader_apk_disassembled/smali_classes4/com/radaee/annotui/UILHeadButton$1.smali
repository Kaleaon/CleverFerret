.class Lcom/radaee/annotui/UILHeadButton$1;
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

    .line 48
    iput-object p1, p0, Lcom/radaee/annotui/UILHeadButton$1;->this$0:Lcom/radaee/annotui/UILHeadButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton$1;->this$0:Lcom/radaee/annotui/UILHeadButton;

    check-cast p1, Lcom/radaee/annotui/UILHeadView;

    invoke-virtual {p1}, Lcom/radaee/annotui/UILHeadView;->getStyle()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/annotui/UILHeadButton;->setStyle(I)V

    .line 52
    iget-object p1, p0, Lcom/radaee/annotui/UILHeadButton$1;->this$0:Lcom/radaee/annotui/UILHeadButton;

    invoke-static {p1}, Lcom/radaee/annotui/UILHeadButton;->access$000(Lcom/radaee/annotui/UILHeadButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->dismiss()V

    return-void
.end method
