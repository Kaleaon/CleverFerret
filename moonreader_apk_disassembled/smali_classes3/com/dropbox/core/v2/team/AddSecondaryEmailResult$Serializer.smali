.class Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "AddSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 959
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 958
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 1046
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 1048
    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 1049
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 1053
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1054
    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_b

    .line 1059
    const-string v3, "success"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1061
    sget-object v0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->INSTANCE:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    move-result-object v0

    .line 1062
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->success(Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto/16 :goto_1

    .line 1064
    :cond_1
    const-string v2, "unavailable"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1066
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1067
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1068
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unavailable(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto/16 :goto_1

    .line 1070
    :cond_2
    const-string v2, "already_pending"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1072
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1073
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1074
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyPending(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto/16 :goto_1

    .line 1076
    :cond_3
    const-string v2, "already_owned_by_user"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1078
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1079
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1080
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyOwnedByUser(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto/16 :goto_1

    .line 1082
    :cond_4
    const-string v2, "reached_limit"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1084
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1085
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1086
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->reachedLimit(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 1088
    :cond_5
    const-string v2, "transient_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1090
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1091
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1092
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->transientError(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 1094
    :cond_6
    const-string v2, "too_many_updates"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1096
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1097
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1098
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tooManyUpdates(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 1100
    :cond_7
    const-string v2, "unknown_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1102
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1103
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1104
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unknownError(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 1106
    :cond_8
    const-string v2, "rate_limited"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1108
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1109
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1110
    invoke-static {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->rateLimited(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 1113
    :cond_9
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    :goto_1
    if-nez v1, :cond_a

    .line 1116
    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 1117
    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_a
    return-object v0

    .line 1057
    :cond_b
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

    .line 958
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 963
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tag()Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1036
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 1028
    :pswitch_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 1029
    const-string v0, "rate_limited"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1030
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 1031
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$800(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1032
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 1020
    :pswitch_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 1021
    const-string v0, "unknown_error"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1022
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 1023
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$700(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1024
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 1012
    :pswitch_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 1013
    const-string v0, "too_many_updates"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1014
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 1015
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$600(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1016
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 1004
    :pswitch_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 1005
    const-string v0, "transient_error"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1006
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 1007
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$500(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1008
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 996
    :pswitch_4
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 997
    const-string v0, "reached_limit"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 998
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 999
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$400(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1000
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 988
    :pswitch_5
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 989
    const-string v0, "already_owned_by_user"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 990
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 991
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$300(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 992
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 980
    :pswitch_6
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 981
    const-string v0, "already_pending"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 982
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 983
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$200(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 984
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 972
    :pswitch_7
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 973
    const-string v0, "unavailable"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 974
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 975
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$100(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 976
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 965
    :pswitch_8
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 966
    const-string v0, "success"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 967
    sget-object v0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->INSTANCE:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->access$000(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->serialize(Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 968
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 958
    check-cast p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
