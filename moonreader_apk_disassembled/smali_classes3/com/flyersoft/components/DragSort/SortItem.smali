.class public Lcom/flyersoft/components/DragSort/SortItem;
.super Ljava/lang/Object;
.source "SortItem.java"


# instance fields
.field public checked:Z

.field public icon:I

.field public index:I

.field public tag:Ljava/lang/Object;

.field public text:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    .line 12
    iput-boolean p2, p0, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    .line 13
    iput p3, p0, Lcom/flyersoft/components/DragSort/SortItem;->icon:I

    .line 14
    iput-object p4, p0, Lcom/flyersoft/components/DragSort/SortItem;->text:Ljava/lang/CharSequence;

    .line 15
    iput-object p5, p0, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    return-void
.end method
