.class Lcom/ramotion/cardslider/CardSliderLayoutManager$1;
.super Ljava/lang/Object;
.source "CardSliderLayoutManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ramotion/cardslider/CardSliderLayoutManager;->onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;


# direct methods
.method constructor <init>(Lcom/ramotion/cardslider/CardSliderLayoutManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 231
    iput-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$1;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$1;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-static {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->-$$Nest$mupdateViewScale(Lcom/ramotion/cardslider/CardSliderLayoutManager;)V

    return-void
.end method
