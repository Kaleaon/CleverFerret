.class Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;
.super Ljava/lang/Object;
.source "HHCConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/HHCConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParsingContext"
.end annotation


# instance fields
.field public caTemp:Lcom/flyersoft/books/chmlib/CharArray;

.field public caTempValue:Lcom/flyersoft/books/chmlib/CharArray;

.field public caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

.field public fileName:Lcom/flyersoft/books/chmlib/CharArray;

.field public hhcIndex:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/HHC$IndexEntry;",
            ">;"
        }
    .end annotation
.end field

.field public id:I

.field public name:Lcom/flyersoft/books/chmlib/CharArray;

.field public outChannel:Ljava/nio/channels/FileChannel;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    new-instance v0, Lcom/flyersoft/books/chmlib/CharArray;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/CharArray;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    .line 214
    new-instance v0, Lcom/flyersoft/books/chmlib/CharArray;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/CharArray;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->name:Lcom/flyersoft/books/chmlib/CharArray;

    .line 216
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x400

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->hhcIndex:Ljava/util/List;

    .line 218
    new-instance v0, Lcom/flyersoft/books/chmlib/CharArray;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/CharArray;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    .line 219
    new-instance v0, Lcom/flyersoft/books/chmlib/CharArray;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/CharArray;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTempValue:Lcom/flyersoft/books/chmlib/CharArray;

    .line 220
    new-instance v0, Lcom/flyersoft/books/chmlib/CharArray;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lcom/flyersoft/books/chmlib/CharArray;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/books/chmlib/HHCConverter-IA;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;-><init>()V

    return-void
.end method
