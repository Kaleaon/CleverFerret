.class Lcom/flyersoft/books/Umd$ChapterPosition;
.super Ljava/lang/Object;
.source "Umd.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/Umd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ChapterPosition"
.end annotation


# instance fields
.field end:I

.field start:I

.field final synthetic this$0:Lcom/flyersoft/books/Umd;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Umd;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 493
    iput-object p1, p0, Lcom/flyersoft/books/Umd$ChapterPosition;->this$0:Lcom/flyersoft/books/Umd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 494
    iput p2, p0, Lcom/flyersoft/books/Umd$ChapterPosition;->start:I

    .line 495
    iput p3, p0, Lcom/flyersoft/books/Umd$ChapterPosition;->end:I

    return-void
.end method
