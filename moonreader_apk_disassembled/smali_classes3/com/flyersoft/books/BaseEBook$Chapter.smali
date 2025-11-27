.class public Lcom/flyersoft/books/BaseEBook$Chapter;
.super Ljava/lang/Object;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/BaseEBook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Chapter"
.end annotation


# instance fields
.field public additionalText:Ljava/lang/String;

.field public brokenChapter:Z

.field public css:Lcom/flyersoft/components/CSS;

.field public css_body_class:Ljava/lang/String;

.field public css_body_id:Ljava/lang/String;

.field public css_body_style:Ljava/lang/String;

.field public css_str:Ljava/lang/String;

.field public expanded:Z

.field public filename:Ljava/lang/String;

.field public hasImageOnly:Ljava/lang/String;

.field public hasSubChapter:Z

.field public id_Tag:Ljava/lang/String;

.field public indent:I

.field public isAboutPageCount:Z

.field public name:Ljava/lang/String;

.field public pageCount:I

.field public pageCountFontSize:F

.field public pure_text:Ljava/lang/String;

.field public pure_text_length:I

.field public size:J

.field public spanned:[Ljava/lang/CharSequence;

.field public spannedLength:I

.field public splitPageCount:[I

.field public splitSpannedLength:[I

.field public text:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/books/BaseEBook;

.field public unload_Tag:Ljava/lang/String;

.field public unloadedImages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public usedFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public word_count:I


# direct methods
.method constructor <init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .line 123
    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->unloadedImages:Ljava/util/ArrayList;

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 124
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x193

    if-le v1, v2, :cond_0

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x190

    invoke-virtual {p2, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "..."

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 126
    :cond_0
    iput-object p2, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 127
    iput-object p3, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    .line 128
    iput-object p4, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 129
    iput-wide p5, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    .line 130
    iput-object p4, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->unload_Tag:Ljava/lang/String;

    .line 131
    iput-boolean v0, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    .line 132
    iput v0, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    const/4 p2, 0x1

    .line 133
    iput-boolean p2, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->expanded:Z

    const/4 p2, 0x0

    .line 134
    iput-object p2, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    .line 135
    const-string p2, ""

    iput-object p2, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    const/4 p2, -0x1

    .line 136
    iput p2, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    iput p2, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    const-wide/16 p2, -0x1

    .line 137
    iput-wide p2, p1, Lcom/flyersoft/books/BaseEBook;->totalSize:J

    return-void
.end method
