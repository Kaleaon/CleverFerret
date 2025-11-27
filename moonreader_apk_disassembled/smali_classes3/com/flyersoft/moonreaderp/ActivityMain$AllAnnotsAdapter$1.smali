.class Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12447
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fillData(ILandroid/view/View;)V
    .locals 1

    .line 12450
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->getView(ILandroid/view/View;)V

    return-void
.end method
