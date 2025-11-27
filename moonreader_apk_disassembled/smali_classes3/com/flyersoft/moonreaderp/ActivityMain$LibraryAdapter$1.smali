.class Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6170
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fillData(ILandroid/view/View;)V
    .locals 1

    .line 6173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->getView(ILandroid/view/View;)V

    return-void
.end method
