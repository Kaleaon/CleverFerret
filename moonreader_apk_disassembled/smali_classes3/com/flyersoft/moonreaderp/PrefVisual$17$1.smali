.class Lcom/flyersoft/moonreaderp/PrefVisual$17$1;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual$17;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual$17;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 595
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17$1;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 1

    const/4 v0, 0x1

    .line 597
    sput-boolean v0, Lcom/flyersoft/tools/A;->fontUnderline:Z

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 598
    :goto_0
    sput-boolean v0, Lcom/flyersoft/tools/A;->dashUnderline:Z

    .line 599
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17$1;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshFontStyle(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
