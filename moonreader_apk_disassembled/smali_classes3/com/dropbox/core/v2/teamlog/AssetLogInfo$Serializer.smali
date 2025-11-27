.class Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "AssetLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AssetLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/AssetLogInfo;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 527
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 526
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AssetLogInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 578
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 580
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 581
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 585
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 586
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_7

    .line 591
    const-string v3, "file"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 593
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/FileLogInfo;

    move-result-object v0

    .line 594
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->file(Lcom/dropbox/core/v2/teamlog/FileLogInfo;)Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    move-result-object v0

    goto :goto_1

    .line 596
    :cond_1
    const-string v3, "folder"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 598
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/FolderLogInfo;

    move-result-object v0

    .line 599
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->folder(Lcom/dropbox/core/v2/teamlog/FolderLogInfo;)Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    move-result-object v0

    goto :goto_1

    .line 601
    :cond_2
    const-string v3, "paper_document"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 603
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo;

    move-result-object v0

    .line 604
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->paperDocument(Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo;)Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    move-result-object v0

    goto :goto_1

    .line 606
    :cond_3
    const-string v3, "paper_folder"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 608
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo;

    move-result-object v0

    .line 609
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->paperFolder(Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo;)Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    move-result-object v0

    goto :goto_1

    .line 611
    :cond_4
    const-string v3, "showcase_document"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 613
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo;

    move-result-object v0

    .line 614
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->showcaseDocument(Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo;)Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    move-result-object v0

    goto :goto_1

    .line 617
    :cond_5
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    :goto_1
    if-nez v1, :cond_6

    .line 620
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 621
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_6
    return-object v0

    .line 589
    :cond_7
    new-instance v0, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v1, "Required field missing: .tag"

    invoke-direct {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 526
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/AssetLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 531
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$AssetLogInfo$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->tag()Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 v2, 0x3

    if-eq v0, v2, :cond_2

    const/4 v2, 0x4

    if-eq v0, v2, :cond_1

    const/4 v2, 0x5

    if-eq v0, v2, :cond_0

    .line 568
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 561
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 562
    const-string v0, "showcase_document"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 563
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->access$400(Lcom/dropbox/core/v2/teamlog/AssetLogInfo;)Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ShowcaseDocumentLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 564
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 554
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 555
    const-string v0, "paper_folder"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 556
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->access$300(Lcom/dropbox/core/v2/teamlog/AssetLogInfo;)Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/PaperFolderLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 557
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 547
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 548
    const-string v0, "paper_document"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 549
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->access$200(Lcom/dropbox/core/v2/teamlog/AssetLogInfo;)Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/PaperDocumentLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 550
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 540
    :cond_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 541
    const-string v0, "folder"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 542
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->access$100(Lcom/dropbox/core/v2/teamlog/AssetLogInfo;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/FolderLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 543
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 533
    :cond_4
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 534
    const-string v0, "file"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 535
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileLogInfo$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;->access$000(Lcom/dropbox/core/v2/teamlog/AssetLogInfo;)Lcom/dropbox/core/v2/teamlog/FileLogInfo;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/FileLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 536
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 526
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/AssetLogInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/AssetLogInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
