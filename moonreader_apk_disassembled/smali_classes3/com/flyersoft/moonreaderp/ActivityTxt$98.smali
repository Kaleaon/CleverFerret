.class Lcom/flyersoft/moonreaderp/ActivityTxt$98;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initTtsPanel()V
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

    .line 11036
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$98;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 11038
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$98;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_tts_buttons(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    return-void
.end method
