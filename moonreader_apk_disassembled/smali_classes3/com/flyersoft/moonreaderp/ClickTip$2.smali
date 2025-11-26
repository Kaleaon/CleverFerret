.class Lcom/flyersoft/moonreaderp/ClickTip$2;
.super Ljava/lang/Object;
.source "ClickTip.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ClickTip;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ClickTip;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ClickTip;)V
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
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ClickTip$2;->this$0:Lcom/flyersoft/moonreaderp/ClickTip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 78
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ClickTip$2;->this$0:Lcom/flyersoft/moonreaderp/ClickTip;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ClickTip;->finish()V

    return-void
.end method
