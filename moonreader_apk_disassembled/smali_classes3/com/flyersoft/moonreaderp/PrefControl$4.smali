.class Lcom/flyersoft/moonreaderp/PrefControl$4;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefControl;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 116
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$4;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 119
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$4;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$msetNineGridEvents(Lcom/flyersoft/moonreaderp/PrefControl;)V

    return-void
.end method
