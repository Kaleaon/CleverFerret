.class Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter$1;
.super Ljava/lang/Object;
.source "PrefShareText.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 359
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 362
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->-$$Nest$fgetlistener(Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 363
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;->-$$Nest$fgetlistener(Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method
