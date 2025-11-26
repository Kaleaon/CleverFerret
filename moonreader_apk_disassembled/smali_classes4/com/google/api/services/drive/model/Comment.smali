.class public final Lcom/google/api/services/drive/model/Comment;
.super Lcom/google/api/client/json/GenericJson;
.source "Comment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/services/drive/model/Comment$QuotedFileContent;
    }
.end annotation


# instance fields
.field private anchor:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private author:Lcom/google/api/services/drive/model/User;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private content:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private createdTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private deleted:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private htmlContent:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private id:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private kind:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private modifiedTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private quotedFileContent:Lcom/google/api/services/drive/model/Comment$QuotedFileContent;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private replies:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Reply;",
            ">;"
        }
    .end annotation
.end field

.field private resolved:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/google/api/client/json/GenericJson;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/api/client/json/GenericJson;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/Comment;->clone()Lcom/google/api/services/drive/model/Comment;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/Comment;->clone()Lcom/google/api/services/drive/model/Comment;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/Comment;
    .locals 1

    .line 340
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/Comment;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/Comment;->clone()Lcom/google/api/services/drive/model/Comment;

    move-result-object v0

    return-object v0
.end method

.method public getAnchor()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->anchor:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthor()Lcom/google/api/services/drive/model/User;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->author:Lcom/google/api/services/drive/model/User;

    return-object v0
.end method

.method public getContent()Ljava/lang/String;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatedTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->createdTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getDeleted()Ljava/lang/Boolean;
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->deleted:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getHtmlContent()Ljava/lang/String;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->htmlContent:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getKind()Ljava/lang/String;
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->kind:Ljava/lang/String;

    return-object v0
.end method

.method public getModifiedTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 268
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->modifiedTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getQuotedFileContent()Lcom/google/api/services/drive/model/Comment$QuotedFileContent;
    .locals 1

    .line 286
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->quotedFileContent:Lcom/google/api/services/drive/model/Comment$QuotedFileContent;

    return-object v0
.end method

.method public getReplies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Reply;",
            ">;"
        }
    .end annotation

    .line 304
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->replies:Ljava/util/List;

    return-object v0
.end method

.method public getResolved()Ljava/lang/Boolean;
    .locals 1

    .line 321
    iget-object v0, p0, Lcom/google/api/services/drive/model/Comment;->resolved:Ljava/lang/Boolean;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/Comment;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/Comment;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/Comment;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/Comment;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 335
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/Comment;

    return-object p1
.end method

.method public setAnchor(Ljava/lang/String;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 138
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->anchor:Ljava/lang/String;

    return-object p0
.end method

.method public setAuthor(Lcom/google/api/services/drive/model/User;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 155
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->author:Lcom/google/api/services/drive/model/User;

    return-object p0
.end method

.method public setContent(Ljava/lang/String;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 174
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->content:Ljava/lang/String;

    return-object p0
.end method

.method public setCreatedTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->createdTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setDeleted(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 208
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->deleted:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setHtmlContent(Ljava/lang/String;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 225
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->htmlContent:Ljava/lang/String;

    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 242
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->id:Ljava/lang/String;

    return-object p0
.end method

.method public setKind(Ljava/lang/String;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 259
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->kind:Ljava/lang/String;

    return-object p0
.end method

.method public setModifiedTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 276
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->modifiedTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setQuotedFileContent(Lcom/google/api/services/drive/model/Comment$QuotedFileContent;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 295
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->quotedFileContent:Lcom/google/api/services/drive/model/Comment$QuotedFileContent;

    return-object p0
.end method

.method public setReplies(Ljava/util/List;)Lcom/google/api/services/drive/model/Comment;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Reply;",
            ">;)",
            "Lcom/google/api/services/drive/model/Comment;"
        }
    .end annotation

    .line 312
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->replies:Ljava/util/List;

    return-object p0
.end method

.method public setResolved(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Comment;
    .locals 0

    .line 329
    iput-object p1, p0, Lcom/google/api/services/drive/model/Comment;->resolved:Ljava/lang/Boolean;

    return-object p0
.end method
