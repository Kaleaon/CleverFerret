.class public Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;
.super Ljava/lang/Object;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LINK_BACK"
.end annotation


# instance fields
.field backChapter:I

.field backFile:Ljava/lang/String;

.field backPosition:J

.field backSplitIndex:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field title:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;Ljava/lang/String;IIJ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 10022
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10023
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;->title:Ljava/lang/CharSequence;

    .line 10024
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;->backFile:Ljava/lang/String;

    .line 10025
    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;->backChapter:I

    .line 10026
    iput p5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;->backSplitIndex:I

    .line 10027
    iput-wide p6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;->backPosition:J

    return-void
.end method
