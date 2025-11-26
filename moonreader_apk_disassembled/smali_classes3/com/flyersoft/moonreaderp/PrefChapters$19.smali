.class Lcom/flyersoft/moonreaderp/PrefChapters$19;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->initAnnotLvDragSelect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1290
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$19;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelectChange(IIZ)V
    .locals 1

    .line 1293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$19;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->doSelectChange(IIZ)V

    return-void
.end method
