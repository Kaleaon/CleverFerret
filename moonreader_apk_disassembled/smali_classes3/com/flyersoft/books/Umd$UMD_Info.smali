.class Lcom/flyersoft/books/Umd$UMD_Info;
.super Ljava/lang/Object;
.source "Umd.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/Umd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UMD_Info"
.end annotation


# static fields
.field public static final DOLLAR:I = 0x24

.field public static final POUND:I = 0x23


# instance fields
.field private author:Ljava/lang/String;

.field private chapterNumber:I

.field public chapterTitles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private contentId:I

.field private contentLength:I

.field private coverFile:Ljava/io/File;

.field private covers:[B

.field private day:Ljava/lang/String;

.field private fileSize:I

.field private gender:Ljava/lang/String;

.field private header:I

.field private month:Ljava/lang/String;

.field private offsets:[I

.field private publisher:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/books/Umd;

.field private title:Ljava/lang/String;

.field private vendor:Ljava/lang/String;

.field private year:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Umd;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 588
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->this$0:Lcom/flyersoft/books/Umd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 1

    .line 634
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getChapterNumber()I
    .locals 1

    .line 706
    iget v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->chapterNumber:I

    return v0
.end method

.method public getChapterTitles()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 714
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->chapterTitles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getContentId()I
    .locals 1

    .line 610
    iget v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->contentId:I

    return v0
.end method

.method public getContentLength()I
    .locals 1

    .line 690
    iget v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->contentLength:I

    return v0
.end method

.method public getCovers()[B
    .locals 1

    .line 722
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->covers:[B

    return-object v0
.end method

.method public getDay()Ljava/lang/String;
    .locals 1

    .line 658
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->day:Ljava/lang/String;

    return-object v0
.end method

.method public getFileSize()I
    .locals 1

    .line 730
    iget v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->fileSize:I

    return v0
.end method

.method public getGender()Ljava/lang/String;
    .locals 1

    .line 682
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->gender:Ljava/lang/String;

    return-object v0
.end method

.method public getHeader()I
    .locals 1

    .line 618
    iget v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->header:I

    return v0
.end method

.method public getMonth()Ljava/lang/String;
    .locals 1

    .line 650
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->month:Ljava/lang/String;

    return-object v0
.end method

.method public getOffsets()[I
    .locals 1

    .line 698
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->offsets:[I

    return-object v0
.end method

.method public getPublisher()Ljava/lang/String;
    .locals 1

    .line 666
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->publisher:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 626
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getVendor()Ljava/lang/String;
    .locals 1

    .line 674
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->vendor:Ljava/lang/String;

    return-object v0
.end method

.method public getYear()Ljava/lang/String;
    .locals 1

    .line 642
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->year:Ljava/lang/String;

    return-object v0
.end method

.method public setAuthor(Ljava/lang/String;)V
    .locals 0

    .line 638
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->author:Ljava/lang/String;

    return-void
.end method

.method public setChapterNumber(I)V
    .locals 0

    .line 710
    iput p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->chapterNumber:I

    return-void
.end method

.method public setChapterTitles(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 718
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->chapterTitles:Ljava/util/ArrayList;

    return-void
.end method

.method public setContentId(I)V
    .locals 0

    .line 614
    iput p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->contentId:I

    return-void
.end method

.method public setContentLength(I)V
    .locals 0

    .line 694
    iput p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->contentLength:I

    return-void
.end method

.method public setCovers([B)V
    .locals 0

    .line 726
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->covers:[B

    return-void
.end method

.method public setDay(Ljava/lang/String;)V
    .locals 0

    .line 662
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->day:Ljava/lang/String;

    return-void
.end method

.method public setFileSize(I)V
    .locals 0

    .line 734
    iput p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->fileSize:I

    return-void
.end method

.method public setGender(Ljava/lang/String;)V
    .locals 0

    .line 686
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->gender:Ljava/lang/String;

    return-void
.end method

.method public setHeader(I)V
    .locals 0

    .line 622
    iput p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->header:I

    return-void
.end method

.method public setMonth(Ljava/lang/String;)V
    .locals 0

    .line 654
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->month:Ljava/lang/String;

    return-void
.end method

.method public setOffsets([I)V
    .locals 0

    .line 702
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->offsets:[I

    return-void
.end method

.method public setPublisher(Ljava/lang/String;)V
    .locals 0

    .line 670
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->publisher:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 630
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->title:Ljava/lang/String;

    return-void
.end method

.method public setVendor(Ljava/lang/String;)V
    .locals 0

    .line 678
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->vendor:Ljava/lang/String;

    return-void
.end method

.method public setYear(Ljava/lang/String;)V
    .locals 0

    .line 646
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMD_Info;->year:Ljava/lang/String;

    return-void
.end method

.method public update()V
    .locals 1

    .line 746
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->chapterTitles:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 747
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/Umd$UMD_Info;->chapterNumber:I

    :cond_0
    return-void
.end method
