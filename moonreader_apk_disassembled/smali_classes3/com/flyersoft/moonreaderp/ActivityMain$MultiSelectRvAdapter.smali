.class public abstract Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "MultiSelectRvAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 8283
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    return-void
.end method
