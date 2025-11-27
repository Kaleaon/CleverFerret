.class public Lcom/flyersoft/tools/A$Shelf_Sort;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Shelf_Sort"
.end annotation


# instance fields
.field public filename:Ljava/lang/String;

.field public position:I

.field public pureFilename:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 9580
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9581
    iput-object p1, p0, Lcom/flyersoft/tools/A$Shelf_Sort;->filename:Ljava/lang/String;

    .line 9582
    iput p2, p0, Lcom/flyersoft/tools/A$Shelf_Sort;->position:I

    .line 9583
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/A$Shelf_Sort;->pureFilename:Ljava/lang/String;

    return-void
.end method
