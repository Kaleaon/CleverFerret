.class Lcom/flyersoft/moonreaderp/PrefVisual$20;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setSytleMaterialSwitchEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 644
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$20;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 647
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$20;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    if-eqz p2, :cond_0

    return-void

    .line 648
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$20;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mjustifiedOptionClick(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/view/View;)V

    .line 649
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$20;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mclearCurlCache(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
